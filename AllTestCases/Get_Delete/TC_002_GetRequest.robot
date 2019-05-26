*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  ../../Resources/R_001_UserKeyword.robot
Documentation  This suite is for making GET Request and fetch user details
#Test Setup  Welcome User
#Test Teardown  End Testcase
suite setup  Welcome User
suite teardown  End Testcase
Force Tags  Hello

# json formatter link-$.data.last_name-type like that
# https://jsonformatter.curiousconcept.com/
# http://jsonpath.com/

*** Variables ***
${App_Base_Url}  https://reqres.in
${Single_User_Id}  2

*** Test Cases ***
Fetch Single User Id
    #[Setup]  Welcome User
    #[Teardown]  End Testcase
    [Tags]  Smoke  Sanity
    create session  FetchData  ${App_Base_Url}
    ${response}=  get request  FetchData  /api/users/${Single_User_Id}
    ${actual_code}=  convert to string  ${response.status_code}
    should be equal  ${actual_code}  200
    #Content will take json format-user to json keyword
    ${json_resp}=  to json  ${response.content}

    # get value from json-use list-data.firstname(use json formatter link)
    @{first_name_list}=  get value from json  ${json_resp}  data.first_name
    # get from list-take first value only
    ${first_name}=  get from list  ${first_name_list}  0
    log to console  ${first_name}
    #Validate
    should be equal  ${first_name}  Janet


    @{last_name_list}=  get value from json  ${json_resp}  data.last_name
    # get from list-take first value only
    ${last_name}=  get from list  ${last_name_list}  0
    log to console  ${last_name}
    #Validate
    should be equal  ${last_name}  Weaver



