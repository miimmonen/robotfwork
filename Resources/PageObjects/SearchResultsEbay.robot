*** Settings ***
Library    SeleniumLibrary
Resource    ./HeaderPageEbay.robot

*** Variables ***
${search_result}    results for


*** Keywords ***
Verify Search Result
    wait until page contains    ${search_result} ${search_text}

Select product condition


Select delivery options