*** Settings ***
Documentation    Basic search
Resource    ../../Resources/CommonFunctionality.robot
Resource    ../../Resources/PageObjects/HeaderPageEbay.robot
Resource    ../../Resources/PageObjects/SearchResultsEbay.robot


Test Setup    CommonFunctionality.Start Testcase
Test Teardown    CommonFunctionality.Finish Testcase

*** Variables ***

*** Test Cases ***
Verify basic search
    [Documentation]    Test case verifies basic search
    [Tags]    Functional

    HeaderPageEbay.Input Search Text and Click Search
    SearchResultsEbay.Verify Search Result
