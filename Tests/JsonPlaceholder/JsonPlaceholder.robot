*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${domain}    jsonplaceholder.typicode.com
${url}    https://${domain}
${browser}    firefox

*** Test Cases ***
Try out All Links
    [Documentation]    Find every link on site, if the link is to another page within same domain, access it
    ...    in another browser-window, otherwise do nothing and continue to next link
    Start Testcase
    @{all_links}    get webelements    tag:a
    FOR    ${link}    IN    @{all_links}
    ${href} =   get element attribute    ${link}    href
        IF    ${href.__contains__('${domain}')}==True
            Open New Browser For Link    ${href}
        ELSE
            continue for loop
        END
    END
    Finish Testcase

*** Keywords ***
Start Testcase
    open browser    ${url}    ${browser}
    maximize browser window

Open New Browser For Link
    [Arguments]    ${link}
    open browser    ${link}    ${BROWSER}    alias=${link}

Finish Testcase
    close all browsers