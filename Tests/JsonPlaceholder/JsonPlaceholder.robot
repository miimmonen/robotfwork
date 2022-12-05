*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${domain}    jsonplaceholder.typicode.com
${url}    https://${domain}
${browser}    firefox

*** Test Cases ***
Try out All Links on Landing Page
    [Documentation]    Find every link on Landing page, if the link is to another page within same domain, access it
    ...    in another browser-window, otherwise do nothing and continue to next link
    Start Testcase
    @{all_links}    create list
    Handle Links On New Page    @{all_links}
    Finish Testcase

*** Keywords ***
Start Testcase
    open browser    ${url}    ${browser}
    maximize browser window

Open New Browser For Link
    [Arguments]    ${link}
    open browser    ${link}    ${BROWSER}    alias=${link}

Handle Links On New Page
    [Arguments]    @{list}
    ${hrefs}    create dictionary
    @{list}    get webelements    tag:a
    FOR    ${link}    IN    @{list}
    ${href} =   get element attribute    ${link}    href
        IF    ${href.__contains__('${domain}')}==True
            Open New Browser For Link    ${href}
        ELSE
            continue for loop
        END
    END

Finish Testcase
    close all browsers