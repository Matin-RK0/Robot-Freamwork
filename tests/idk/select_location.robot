*** Settings ***
Library           SeleniumLibrary
Resource          ../variables/env_vars.robot
Resource          ../resources/common.robot
Resource          ../variables/pub_variables.robot
Suite Setup       Initialize Mobile Browser
Test Setup        Go To Zoodex Walk
Test Teardown     Capture Page Screenshot
Suite Teardown    Close All Browsers

*** Test Cases ***
Select Location
    Sleep    3s
    Wait Until Element Is Visible    ${SELECT_LOCATION_HEADER_BUTTON}    ${TIMEOUT}
    Click Element    ${SELECT_LOCATION_HEADER_BUTTON}
    Sleep    3s
    Click Element    ${SUBMIT_LOCATION_BUTTON}
    Sleep    2s