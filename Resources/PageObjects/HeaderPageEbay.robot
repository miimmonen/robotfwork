*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Input Search Text and Click Search
    input text    //*[@id="gh-ac"]    mobile
    click element    //input[@type='submit']

Click on Advanced Search Link
    click element    //*[@id="gh-as-a"]