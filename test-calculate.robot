*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    http://localhost:5000

*** Test Cases ***
Test Plus Operation With 5 and 6
    ${response}=    Call Plus Endpoint    5    6
    Should Be Equal As Numbers    ${response.status_code}    200
    ${response_body}=    Parse JSON Response    ${response}
    Should Be Equal As Numbers    ${response_body}    11

Test Plus Operation With 8 and 3
    ${response}=    Call Plus Endpoint    8    3
    Should Be Equal As Numbers    ${response.status_code}    200
    ${response_body}=    Parse JSON Response    ${response}
    Should Be Equal As Numbers    ${response_body}    11

*** Keywords ***
Call Plus Endpoint
    [Arguments]    ${a}    ${b}
    ${url}=    Catenate    ${BASE_URL}/plus/${a}/${b}
    ${response}=    GET    ${url}
    [RETURN]    ${response}

Parse JSON Response
    [Arguments]    ${response}
    ${json_data}=    Evaluate    json.loads('${response.text}')    json
    [RETURN]    ${json_data['plus']}
