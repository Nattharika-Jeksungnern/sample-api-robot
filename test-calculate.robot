*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem

*** Variables ***
${BASE_URL}    http://localhost:5000

*** Test Cases ***
Test Plus Operation With 5 and 6
    ${response}=    Call Plus Endpoint    5    6
    Should Be Equal As Numbers    ${response.status_code}    200
    ${response_body}=    Get Response Body    ${response}
    Should Be Equal As Numbers    ${response_body}    11

Test Plus Operation With 8 and 3
    ${response}=    Call Plus Endpoint    8    3
    Should Be Equal As Numbers    ${response.status_code}    200
    ${response_body}=    Get Response Body    ${response}
    Should Be Equal As Numbers    ${response_body}    11

*** Keywords ***
Call Plus Endpoint
    [Arguments]    ${a}    ${b}
    ${url}=    Catenate    ${BASE_URL}/plus/${a}/${b}
    ${response}=    GET    ${url}
    RETURN    ${response}

Get Response Body
    [Arguments]    ${response}
    ${response_body}=    Evaluate    ${response.json()['plus']}    return ${response_body}
    RETURN    ${response_body}
