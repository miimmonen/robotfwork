*** Settings ***
Documentation    Making a bing -search
Library             SeleniumLibrary
Variables    ../../Resources/BingWebElements.py

Test Setup        Start Testcase
Test Teardown     Finish Testcase

*** Variables ***


*** Test Cases ***
Verify basic search
    [Documentation]    Bing search test
    [Tags]    Functional


    click element    ${SearchInputBox}
    input text    ${SearchInputBox}   ${SearchCriteria}
    Press Keys    ${SearchInputBox}    RETURN
    wait until page contains    ${URL}


*** Keywords ***
Start Testcase
    open browser    ${URL}    ${Browser}
    maximize browser window

Finish Testcase
    close browser