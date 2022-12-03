*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    ../../Resources/Functions/color_to_hex.py

*** Variables ***
${url}    https://www.saavutettavuusvaatimukset.fi
${browser}    chrome
${PATH}    ${CURDIR}/../../Results/saavutettavuus-links.txt

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

Check the background color of Newsletters
    [Documentation]    Checks the background color for newsletter-div
    Start Testcase
    ${main_bg}    Get WebElement    class:newsletter
    capture element screenshot    ${main_bg}
    ${main_bg_color}    call method    ${main_bg}    value_of_css_property    background-color
    log    ${main_bg_color}
    should be equal     ${main_bg_color}    	rgba(251, 213, 165, 1)
    ${hex}    get_hex_color    ${main_bg_color}
    log    ${hex}
    Finish Testcase

*** Keywords ***
Start Testcase
    open browser    ${url}    ${browser}
    maximize browser window


Finish Testcase
    close all browsers