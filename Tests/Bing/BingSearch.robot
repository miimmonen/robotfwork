*** Settings ***
Documentation    Making a bing -search
Library             SeleniumLibrary

Test Setup        Start Testcase
Test Teardown     Finish Testcase

*** Variables ***
${URL}    https://www.bing.com/
${BROWSER}    chrome

*** Test Cases ***
Verify basic search
    [Documentation]    Bing search test
    [Tags]    Functional test


    click element    //*[@id="sb_form_q"]
    input text    //*[@id="sb_form_q"]    ebay
    Press Keys    //*[@id="sb_form_q"]    RETURN
    wait until page contains    https://www.ebay.com


*** Keywords ***
Start Testcase
    open browser    ${URL}    ${BROWSER}
    maximize browser window

Finish Testcase
    close browser