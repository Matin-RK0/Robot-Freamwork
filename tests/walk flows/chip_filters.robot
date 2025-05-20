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
Chip Filters Test
    Sleep    3s
    Wait Until Element Is Visible    ${SEARCH}    ${TIMEOUT}
    Wait Until Element Is Visible    ${NEWEST}    ${TIMEOUT}
    Click Element    ${NEWEST}
    Sleep    2s
    Wait Until Element Is Visible    ${CLOSEST}    ${TIMEOUT}
    Click Element    ${CLOSEST}
    Sleep    3s
    Click Element    ${SUBMIT_LOCATION_BUTTON}
    Sleep    2s
    Execute Javascript    window.scrollBy(0, 500)
    Wait Until Element Is Visible    ${TODAY_OFF}    ${TIMEOUT}
    Sleep    2s
    Click Element    ${TODAY_OFF}
    Sleep    2s
    Click Element    ${TOMARROW_OFF}
    Sleep    2s
    Click Element    ${NOW_OPEN}
    Sleep    2s