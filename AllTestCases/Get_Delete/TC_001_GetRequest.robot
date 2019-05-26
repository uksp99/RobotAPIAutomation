*** Settings ***
Library  RequestsLibrary
Documentation  This suite is for making GET Request and fetch user details
test timeout  1s

*** Variables ***
${Base_URL}  https://reqres.in

*** Test Cases ***
User Details
    create session  Get_User_Details  ${Base_URL}
    ${response}=  get request  Get_User_Details  /api/users?page=2
    log to console  ${response.status_code}
    log to console  ${response.content}
