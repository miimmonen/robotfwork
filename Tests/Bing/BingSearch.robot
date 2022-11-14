*** Settings ***
Documentation    Making a bing -search
Library             SeleniumLibrary

*** Variables ***
${URL}    https://www.bing.com/
${BROWSER}    chrome

*** Test Cases ***
Verify basic search
    [Documentation]    Bing search test
    [Tags]    Functional test

    open browser    ${URL}    ${BROWSER}
    click element    //*[@id="sb_form_q"]
    input text    //*[@id="sb_form_q"]    ebay
    Press Keys    //*[@id="sb_form_q"]    RETURN
    wait until page contains    https://www.ebay.com
    close browser