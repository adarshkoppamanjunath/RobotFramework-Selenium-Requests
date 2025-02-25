*** Settings ***
Library       String
Resource      ../apis/apis.robot
Suite Setup   API Test Setup

*** Keywords ***
API Test Setup
    Log To Console   \nCreate Token as part of setup
    ${response}=   Execute Token API And Return Result
    ${access_token}=   Set Variable   ${response.json()["access_token"]} 
    Set Suite Variable    ${access_token}

*** Test Cases ****
Verify Create Token
    Log To Console   \nThis test will verify if create token api return 201 or not , along with the token included
    ${response}=    Execute Token API And Return Result
    Should Be Equal As Strings  ${response.status_code}  201
    Should Contain   ${response.json()}   access_token

Verify Add New Item And Check If It Is Reflecting In Get Item And Delete The Same
    Log To Console   \nThis test will create new iteam and check the same in get and delete.
    ${data}    evaluate  {"item_name": "Google Pixel 9" , "item_description" : "Google pixel 9 12MP Front Camera", "item_price":950}
    ${data}    Evaluate    json.dumps(${data})    json
    ${response} =    Execute Add New Item And Return Result    ${access_token}   ${data}
    Should Be Equal As Strings  ${response.status_code}  201
    ${match}      Get Regexp Matches    ${response.json()["message"]}    [0-9]+
    ${item_id} =  Set Variable  ${match}[0]
    ${response} =    Execute Get Item And Return Result   ${access_token}   ${item_id}
    Should Be Equal As Strings  ${response.status_code}  200
    Should Contain   ${response.json()["item_name"]}    Google Pixel 9
    Should Contain   ${response.json()["item_description"]}    Google pixel 9 12MP Front Camera
    Should Be Equal As Strings   ${response.json()["item_price"]}    950.0
    ${response} =   Execute Delete Item And Return Result   ${access_token}  ${item_id}
    Should Be Equal As Strings  ${response.status_code}  204
    ${response}=         Run Keyword And Ignore Error     Execute Get Item And Return Result     ${access_token}    ${item_id}
    Should Contain      ${response}[1]    HTTPError: 404 Client Error: Not Found for url
  




