*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://miimmonen.github.io/react-monsters/
${browser}    firefox

*** Test Cases ***
Search For Monsters
    [Documentation]    Basic search for monsters on a monster rolodex
    Start Testcase
    input text    class:monster-search-box    he
    wait until page contains    Chelsey Dietrich
    wait until page contains    Glenna Reichert
    page should not contain    Ervin Howell
    Finish Tescase

*** Keywords ***
Start Testcase
    open browser    ${url}    ${browser}
    maximize browser window

Finish Tescase
    close all browsers