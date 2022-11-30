*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_alert
${browser}    chrome

*** Test Cases ***
Interacting With Frames
    [Documentation]    Simple test for interacting with frames
    Start Testcase
    sleep    1s
    click element    id:accept-choices
    select frame    id:iframeResult
    click button    tag:button
    alert should be present
    Finish Testcase

*** Keywords ***
Start Testcase
    open browser    ${url}    ${browser}

Finish Testcase
    close all browsers


