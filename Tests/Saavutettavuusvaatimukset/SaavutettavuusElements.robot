*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${url}    https://www.saavutettavuusvaatimukset.fi
${browser}    chrome
${PATH}    ${CURDIR}/../../Results/links.txt

*** Test Cases ***
Check The Links on page
    [Documentation]    Enters the site to gather all of the links from page
    create file    ${PATH}
    file should exist    ${PATH}
    Start Testcase
    @{links}    get webelements    tag:a
    FOR    ${link}    IN    @{links}
    ${href} =   get element attribute    ${link}    href
    append to file    ${PATH}    ${href}\n
    log    ${href}
    END
    Finish Testcase

*** Keywords ***
Start Testcase
    open browser    ${url}    ${browser}


Finish Testcase
    close all browsers