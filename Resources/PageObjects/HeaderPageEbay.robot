*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${search_text}    air fryer

*** Keywords ***
Input Search Text and Click Search
    input text    //*[@id="gh-ac"]    ${search_text}
    click element    //input[@type='submit']

Click on Advanced Search Link
    click element    //*[@id="gh-as-a"]