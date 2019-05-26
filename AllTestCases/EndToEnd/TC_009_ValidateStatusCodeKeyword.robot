*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  ../../Resources/R_001_UserKeyword.robot

*** Variables ***
${App_Base_Url}  https://thetestingworldapi.com/

*** Test Cases ***
Fetch Id
    Fetch and Validate Get Status Code  30  200
    ${response}=  Fetch and Return Get Response  50
    log to console  ${response.content}
    ${response1}=  Fetch and Return Get Response  51
    log to console  ${response1.content}
