*** Settings ***
Documentation    Basic search in Ebay
Library    SeleniumLibrary

Test Setup    Start Testcase
Test Teardown    Finish Testcase

*** Variables ***
${URL}    https://www.ebay.com

*** Test Cases ***
Verify basic search functionality for Ebay
    [Documentation]    This test case verifies the basic search
    [Tags]    Functional

    input text    //*[@id="gh-ac"]    football
    click element    //input[@type='submit']
    wait until page contains    results for football


*** Keywords ***
Start Testcase
    open browser   ${URL}     firefox
    maximize browser window

Finish Testcase
    close browser