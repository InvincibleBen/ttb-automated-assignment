# 3. Create automation script using your preferred programming language for test Rest API GET request.

*** Settings ***
Library  RequestsLibrary

*** Variables ***

*** Keywords ***

*** Test Cases ***
Get user profile success
    ${rsp}  Get  https://reqres.in/api/users/12  expected_status=200
    Should Be True    ${rsp.json()}[data][id] == 12
    Should Be True    '${rsp.json()}[data][email]' == 'rachel.howell@reqres.in'
    Should Be True    '${rsp.json()}[data][first_name]' == 'Rachel'
    Should Be True    '${rsp.json()}[data][last_name]' == 'Howell'
    Should Be True    '${rsp.json()}[data][avatar]' == 'https://reqres.in/img/faces/12-image.jpg'

Get user profile but user not found
    ${rsp}  Get  https://reqres.in/api/users/1234  expected_status=404
    Should Be True    '${rsp.json()}' == '{}'

    
    
    
    