*** Settings ***
Documentation    Logging in to saucedemo -site
Library    SeleniumLibrary

Test Setup    Start Testcase
Test Teardown    Finish Testcase

*** Variables ***
${URL}    https://www.saucedemo.com
${BROWSER}    firefox
${login_btn}    id:login-button
${username_field}    id:user-name
${password_field}    id:password
${username}    standard_user
${password}    secret_sauce

*** Test Cases ***
Login to saucedemo -site
    [Documentation]    Basic login to saucedemo by saving the element to variable
    [Tags]    Funtional

    ${user} =  Get WebElement    ${username_field}
    input text    ${user}    ${username}
    ${pass} =    Get WebElement    ${password_field}
    input text    ${pass}    ${password}
    click button    ${login_btn}
    Check Login

Login2 to saucedemo -site
    [Documentation]    Basic login to saucedemo without saving element to variable
    [Tags]    Funtional

    input text    ${username_field}   ${username}
    input text    ${password_field}   ${password}
    click button    ${login_btn}
    Check Login

Login with Keywords
    [Documentation]    Basic login using keywords and arguments
    [Tags]    Functional
    Input User Credentials    ${username}    ${password}
    Click Login
    Check Login

*** Keywords ***

Click Login
    click button    ${login_btn}

Input User Credentials
    [Arguments]     ${user_name}  ${password}
    input text    ${username_field}   ${user_name}
    input text    ${password_field}   ${password}

Check Login
    wait until page contains    Products

Start Testcase
    open browser    ${URL}    ${BROWSER}
    maximize browser window

Finish Testcase
    close browser