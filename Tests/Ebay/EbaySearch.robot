*** Settings ***
Documentation    Basic search in Ebay
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.ebay.com

*** Test Cases ***
Verify basic search functionality for Ebay
    [Documentation]    This test case verifies the basic search
    [Tags]    Functional

    Start Testcase
    input text    //*[@id="gh-ac"]    football
    click element    //input[@type='submit']
    wait until page contains    results for football
    close browser


*** Keywords ***
Start Testcase
    open browser   ${URL}     firefox
    maximize browser window