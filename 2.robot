# 2. Create automation script to test website ‘http://the-internet.herokuapp.com/login’ following test cases in table below. You can use your preferred programming language.

*** Settings ***
Library  SeleniumLibrary  timeout=10  implicit_wait=10
Suite Setup  Open Browser  browser=gc
Suite Teardown  Close All Browsers

*** Variables ***
${txt_username}  id=username
${txt_password}  id=password
${btn_login}  //i[contains(text(),'Login')]
${btn_logout}  //a[@href="/logout"]

*** Keywords ***

*** Test Cases ***
Login success
    Go To  http://the-internet.herokuapp.com/login
    Input Text    ${txt_username}    tomsmith
    Input Text    ${txt_password}    SuperSecretPassword!
    Click Element    ${btn_login}
    Page Should Contain    You logged into a secure area!
    Click Element    ${btn_logout}
    Page Should Contain    You logged out of the secure area!

Login failed - Password incorrect
    Go To  http://the-internet.herokuapp.com/login
    Input Text    ${txt_username}    tomsmith
    Input Text    ${txt_password}    Password!
    Click Element    ${btn_login}
    Page Should Contain    Your password is invalid!

Login failed - Username not found
    Go To  http://the-internet.herokuapp.com/login
    Input Text    ${txt_username}    tomholland
    Input Text    ${txt_password}    Password!
    Click Element    ${btn_login}
    Page Should Contain    Your username is invalid!