*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${App_Base_Url}  https://thetestingworldapi.com/
${original_first_name}  udhay
${update_first_name}  kumar


*** Test Cases ***
E2E Test Case
    create session  E2E  ${App_Base_Url}
    &{header}=  create dictionary  Content-Type=application/json
    &{body}=  create dictionary   first_name=${original_first_name}  middle_name=John  last_name=kannan  date_of_birth=10/10/1995
    ${post_response}=  post request  E2E  api/studentsDetails   headers=${header}  data=${body}
    # Get the id and convert in to json format(Content string format now)
     ${json_response}=  to json  ${post_response.content}
     @{id_list}=  get value from json  ${json_response}  id
     log to console  ${id_list}
     ${id}=  get from list  ${id_list}  0
     log to console  ${id}

# update-id need to update
    &{body1}=  create dictionary   id=${id}  first_name=${update_first_name}  middle_name=John  last_name=kannan  date_of_birth=10/10/1995
    ${put_response}=  put request  E2E  api/studentsDetails/${id}  headers=${header}  data=${body1}
    log to console  ${put_response.content}
    log to console  ${put_response.status_code}


    Fetch Details and Validate  ${id}



#Delete-post method delete
    ${delete_response}=  delete request  E2E  api/studentsDetails/${id}
    ${json_delete}=  to json  ${delete_response.content}
    @{Message}=  get value from json  ${json_delete}  status
    ${status_message}=  get from list  ${Message}  0
    should be equal  ${status_message}  true


*** Keywords ***
Fetch Details and Validate
    # Get
    [Arguments]  ${student_id}
    ${get_request}=  get request  E2E  api/studentsDetails/${student_id}
    ${json_response1}=  to json  ${get_request.content}
    @{list_first_name}=  get value from json  ${json_response1}  data.first_name
    ${first_name}=  get from list  ${list_first_name}  0
    should be equal  ${first_name}  ${update_first_name}



















