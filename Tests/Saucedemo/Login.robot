*** Settings ***
Documentation    Logging in to saucedemo -site
Library    SeleniumLibrary

Test Setup    Start Testcase
Test Teardown    Finish Testcase

*** Variables ***
${URL}    https://www.saucedemo.com
${BROWSER}    firefox


*** Test Cases ***
Login to saucedemo -site
    [Documentation]    Basic login to saucedemo by saving the element to variable
    [Tags]    Funtional test

    ${user} =  Get WebElement    id:user-name
    input text    ${user}    standard_user
    ${pass} =    Get WebElement    id:password
    input text    ${pass}    secret_sauce
    click button    id:login-button

Login2 to saucedemo -site
    [Documentation]    Basic login to saucedemo without saving element to variable
    [Tags]    Funtional test

    input text    id:user-name    standard_user
    input text    id:password   secret_sauce
    click button    id:login-button

*** Keywords ***

Start Testcase
    open browser    ${URL}    ${BROWSER}
    maximize browser window

Finish Testcase
    close browser