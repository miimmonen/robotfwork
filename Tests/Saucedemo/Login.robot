*** Settings ***
Documentation    Logging in to saucedemo -site
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com
${BROWSER}    edge


*** Test Cases ***
Login to saucedemo -site
    [Documentation]    Basic login to saucedemo by saving the element to variable
    [Tags]    Funtional test

    Start Testcase
    ${user} =  Get WebElement    id:user-name
    input text    ${user}    standard_user
    ${pass} =    Get WebElement    id:password
    input text    ${pass}    secret_sauce
    click button    id:login-button
    close browser


Login2 to saucedemo -site
    [Documentation]    Basic login to saucedemo without saving element to variable
    [Tags]    Funtional test

    Start Testcase
    input text    id:user-name    standard_user
    input text    id:password   secret_sauce
    click button    id:login-button
    close browser

*** Keywords ***

Start Testcase
    open browser    ${URL}    ${BROWSER}
    maximize browser window