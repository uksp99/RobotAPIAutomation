*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Documentation  This suite is for making Put Request and update user details

*** Variables ***
${App_Base_Url}  https://thetestingworldapi.com/

*** Test Cases ***
Update Resource
    create session  AddData  ${App_Base_Url}
    &{body}=  create dictionary  id=5771  first_name=William  middle_name=John  last_name=udhay  date_of_birth=10/10/1995
    &{header}=  create dictionary  Content-Type=application/json
    ${response}=  post request  AddData  api/studentsDetails/5771  data=${body}  headers=${header}
    ${actual_code}=  convert to string  ${response.status_code}
    should be equal  ${actual_code}  201
    #Content will take json format-user to json keyword
    ${json_resp}=  to json  ${response.content}
    # Get request
    ${response1}=  get request  AddData  api/studentsDetails/5771
    ${code}=  convert to string  ${response1.status_code}
    should be equal  ${code}  200
    #Content will take json format-user to json keyword
    ${resp}=  to json  ${response1.content}

