*** Settings ***
Library  RequestsLibrary
Variables  ../utils/urls.py

*** Keywords ***
Execute Token API And Return Result
    Log To Console   \n This keyword will execute login api and return response.
    ${headers} =  Create Dictionary  Content-Type=application/x-www-form-urlencoded
    ${data} =  Create Dictionary   username=${admin_username}  password=${admin_password}
    ${response} =  POST  ${base_url}/${create_token}  data=${data}  headers=${headers}
    Log To Console   \n Status Code: ${response.status_code} Response Data: ${response.json()}
    RETURN   ${response}

Execute Add New Item And Return Result
    [Arguments]    ${access_token}   ${data}
    Log To Console  \nThis keyword will execute add new item api and return response.
    ${headers} =   Create Dictionary   Content-Type=application/json   Authorization=Bearer ${access_token}
    ${response} =    POST    ${base_url}/${add_new_item}   data=${data}  headers=${headers}
    Log To Console   \n Status Code: ${response.status_code} Response Data: ${response.json()}
    RETURN   ${response}

Execute Get Item And Return Result
    [Arguments]    ${access_token}    ${item_id}
    Log To Console  \nThis keyword will execute item api and return response.
    ${headers} =   Create Dictionary   Content-Type=application/json   Authorization=Bearer ${access_token}
    ${response} =    GET    ${base_url}/${get_item_detail}/${item_id}    headers=${headers}
    Log To Console   \n Status Code: ${response.status_code} Response Data: ${response.json()}
    RETURN   ${response}

Execute Delete Item And Return Result
    [Arguments]    ${access_token}   ${item_id}
    Log To Console  \nThis keyword will execute delete item api and return response.
    ${headers} =   Create Dictionary   Content-Type=application/json   Authorization=Bearer ${access_token}
    ${response} =    Delete    ${base_url}/${delete_item}/${item_id}    headers=${headers}
    Log To Console   \n Status Code: ${response.status_code}
    RETURN   ${response}






