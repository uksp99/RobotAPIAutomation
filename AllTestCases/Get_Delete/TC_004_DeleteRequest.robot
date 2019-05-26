*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Documentation  This suite is for making Delete Request and delete user details

*** Variables ***
${App_Base_Url}  https://reqres.in

*** Test Cases ***
Validate Delete Request
    create session  AppAccess  ${App_Base_Url}
    ${response}=  delete request  AppAccess  /api/users/2
    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  200
    ${json_resp}=  to json  ${response.content}
    @{status_list}=  get value from json  ${json_resp}   status
    ${status}=  get from list  ${status_list}  0
    should be equal  ${status}  true
