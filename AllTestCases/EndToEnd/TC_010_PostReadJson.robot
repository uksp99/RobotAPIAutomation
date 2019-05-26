*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  ../../Resources/R_001_UserKeyword.robot

*** Variables ***
${App_Base_Url}  https://thetestingworldapi.com/


*** Test Cases ***
Create New Resource
    create session  AddData  ${App_Base_Url}
    &{header}=  create dictionary  Content-Type=application/json
    ${jsonContent}=  Fetch Request Content
    ${response}=  post request  AddData  api/studentsDetails  data=${jsonContent}  headers=${header}
    log to console  ${response.content}
    ${actual_code}=  convert to string  ${response.status_code}
    should be equal  ${actual_code}  201
    log to console  ${response.content}
