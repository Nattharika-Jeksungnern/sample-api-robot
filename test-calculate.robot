*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Test Plus Operation With Integers
    [Arguments]    ${a}    ${b}    ${expected_result}
    ${url}=    Catenate    http://localhost:5000/plus/${a}/${b}
    ${response}=    GET    ${url}
    Should Be Equal As Numbers    ${response.status_code}    200
    ${response_body}=    Evaluate    json.loads(response.text)    json
    Should Be Equal As Numbers    ${response_body}    ${expected_result}

Test Plus Operation With 5 and 6
    Test Plus Operation With Integers    5    6    11

Test Plus Operation With 8 and 3
    Test Plus Operation With Integers    8    3    11
