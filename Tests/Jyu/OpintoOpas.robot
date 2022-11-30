*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${url}    https://opinto-opas.jyu.fi/2022/fi/haku/
${browser}    chrome
${search_input}    ohjelmointi

*** Test Cases ***
Basic Search For Courses
    [Documentation]    Input searchtext and seek for a common course. Check the results for the course.
    ${default_wait}    get selenium implicit wait
    log    ${default_wait}
    ${time_out}    get selenium timeout
    log    ${time_out}
    Start Testcase
    Input Text And Search    ${search_input}
    page should contain    Ohjelmointi 2
    page should contain    Ohjelmointi 1
    page should not contain    Kypsyysnäyte
    #wait until page contains    kissa
    set selenium implicit wait    3s
    Finish Testcase

Basic Search With Checkboxes
    [Documentation]    Input searchtext and seek for a common course with checbox selection. Check the results for the course.
    Start Testcase
    ${impl_wait}    get selenium implicit wait
    log    ${impl_wait}
    set selenium implicit wait    0s
    select checkbox    id:type-courseUnit
    Input Text And Search    ${search_input}
    page should contain    Ohjelmointi 2
    page should contain    Ohjelmointi 1
    unselect checkbox    id:type-courseUnit
    select checkbox    id:type-module
    page should not contain    Ohjelmointi 2
    page should not contain    Ohjelmointi 1
    #wait until page contains    kissa    timeout=10s
    Finish Testcase
*** Keywords ***


Start Testcase
    open browser    ${url}    ${browser}

Input Text And Search
    [Arguments]     ${search_text}
    input text       //*[@id="content"]/div/div/div[1]/div/input    ${search_text}
    click button    //*[@id="content"]/div/div/div[1]/div/button

Finish Testcase
    close all browsers