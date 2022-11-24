*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Dictionary -variables can be used in multiple ways, one is like this. Defining a value for different servers
&{URL}    prod=https://www.ebay.com    dev=https://dev.ebay.com    qa=https://qa.ebay.com

*** Keywords ***
Start Testcase
    open browser   ${URL.prod}     firefox
    maximize browser window

Finish Testcase
    close browser