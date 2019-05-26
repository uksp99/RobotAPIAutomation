*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  ../ReadContent/ReadJsonContent.py

*** Variables ***
${App_Base_Url}  https://thetestingworldapi.com/

*** Keywords ***
Fetch and Validate Get Status Code
    [Arguments]  ${student_id}   ${expected_status_code}
    [Documentation]  This keyword is for validating status code of given student
    create session  SName  ${App_Base_Url}
    ${response}=  get request  SName  api/studentsDetails/${student_id}
    ${statusC}=  convert to string  ${response.status_code}
    should be equal  ${expected_status_code}  ${statusC}

Fetch and Return Get Response
    [Arguments]  ${student_id}
    create session  SName  ${App_Base_Url}
    ${response}=  get request  SName  api/studentsDetails/${student_id}
    [Return]  ${response}

Fetch Request Content
    ${json_body}=  read_request_content
    [Return]  ${json_body}

Welcome User
    [Documentation]  Executing new test case
    log to console  This is starting of testcases

End Testcase
    [Documentation]  Testcase completed
    log to console  This is end of testcases









