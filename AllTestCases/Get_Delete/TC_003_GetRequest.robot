*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

#Get request with parameters
#https://reqres.in///api/users?page=2
# After ? whatever return that is one parameter(page=2)
#parameter in the form of key and value
*** Variables ***
${App_Base_Url}  https://reqres.in


*** Test Cases ***
Validate Get Request With Parameter
    [Tags]  Sanity  Regression
    create session  Get_Param  ${App_Base_Url}
    &{param}=  create dictionary  page=2
    ${response}=  get request  Get_Param  /api/users  params=${param}
    ${actual_code}=  convert to string  ${response.status_code}
    should be equal  ${actual_code}  200
    #Content will take json format-user to json keyword
    ${json_resp}=  to json  ${response.content}

# Name
    # get value from json-use list-data.firstname(use json formatter link)
    @{name_list}=  get value from json  ${json_resp}  data[1].first_name
    # get from list-take first value only
    ${first_name}=  get from list  ${name_list}  0
    log to console  ${first_name}
    #Validate
    should be equal  ${first_name}  Charles

# email
    @{email_list}=  get value from json  ${json_resp}  data[1].email
    # get from list-take first value only
    ${email}=  get from list  ${email_list}  0
    log to console  ${email}
    #Validate
    should be equal  ${email}  charles.morris@reqres.in



