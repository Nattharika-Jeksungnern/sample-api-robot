*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    http://localhost:5000

*** Test Cases ***
Test Plus Operation With 5 and 6
    ${response}=    Call Plus Endpoint    5    6
    Should Be Equal As Numbers    ${response.status_code}    200
    ${response_body}=    Evaluate    json.loads(response.text)    json
    Should Be Equal As Numbers    ${response_body['plus']}    11

Test Plus Operation With 8 and 3
    ${response}=    Call Plus Endpoint    8    3
    Should Be Equal As Numbers    ${response.status_code}    200
    ${response_body}=    Evaluate    json.loads(response.text)    json
    Should Be Equal As Numbers    ${response_body['plus']}    11

*** Keywords ***
Call Plus Endpoint
    [Arguments]    ${a}    ${b}
    ${url}=    Catenate    ${BASE_URL}/plus/${a}/${b}
    ${response}=    GET    ${url}
    [Return]    ${response}
