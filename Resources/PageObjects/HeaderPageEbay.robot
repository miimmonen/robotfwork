*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${search_text}    air fryer
@{search_list}    books    magazines    toys

*** Keywords ***
Input Search Text and Click Search
    input text    //*[@id="gh-ac"]    ${search_text}
    click element    //input[@type='submit']

Input Search from list and Search
    input text    //*[@id="gh-ac"]    ${search_list}[2]
    click element    //input[@type='submit']

Click on Advanced Search Link
    click element    //*[@id="gh-as-a"]