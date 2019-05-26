*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Documentation  This suite is for making Post Request and create user details

*** Variables ***
${App_Base_Url}  https://thetestingworldapi.com/

*** Test Cases ***
Create New Resource
    [Tags]  Sanity
    create session  AddData  ${App_Base_Url}
    &{body}=  create dictionary  first_name=William  middle_name=John  last_name=Joe  date_of_birth=10/10/1995
    &{header}=  create dictionary  Content-Type=application/json
    ${response}=  post request  AddData  api/studentsDetails  data=${body}  headers=${header}
    ${actual_code}=  convert to string  ${response.status_code}
    should be equal  ${actual_code}  201
    #Content will take json format-user to json keyword
    ${json_resp}=  to json  ${response.content}
