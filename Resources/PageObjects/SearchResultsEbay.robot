*** Settings ***
Library    SeleniumLibrary
Resource    ./HeaderPageEbay.robot

*** Variables ***
${search_result}    results for


*** Keywords ***
Verify Search Result
    wait until page contains    ${search_result} ${search_text}

Verify List Search
    wait until page contains    ${search_result} ${search_list}[2]


Select delivery options