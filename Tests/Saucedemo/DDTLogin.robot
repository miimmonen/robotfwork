*** Settings ***
Documentation    Logging in to saucedemo -site using data driven testing
Library    SeleniumLibrary

Test Setup   Start Testcase
Test Teardown    Finish Testcase
Test Template    Invalid Login Scenarios

*** Variables ***
${URL}    https://www.saucedemo.com
${BROWSER}    firefox
${login_btn}    id:login-button
${username_field}    id:user-name
${password_field}    id:password

*** Test Cases ***
Verify Login Fails - Blank Username and Password
    _    _    Epic sadface: Username and password do not match any user in this service
Verify Login Fails - Wrong username
    standard_usera    secret_sauce    Epic sadface: Username and password do not match any user in this service
Verify Login Fails - Wrong password
    standard_user    sercret_sac    Epic sadface: Username and password do not match any user in this service
Verify Login Fails - Wrong username and password
    stanta    secret    Epic sadface: Username and password do not match any user in this service

*** Keywords ***

Invalid Login Scenarios
    [Arguments]    ${username}    ${password}    ${error_msg}
    Input User Credentials    ${username}    ${password}
    Click Login
    wait until page contains    ${error_msg}

Click Login
    click button    ${login_btn}

Input User Credentials
    [Arguments]     ${user_name}  ${password}
    input text    ${username_field}   ${user_name}
    input text    ${password_field}   ${password}

Start Testcase
    open browser    ${URL}    ${BROWSER}    alias=ChromeBrow
    maximize browser window

Finish Testcase
    close all browsers