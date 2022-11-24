*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.ebay.com

*** Keywords ***
Start Testcase
    open browser   ${URL}     firefox
    maximize browser window

Finish Testcase
    close browser