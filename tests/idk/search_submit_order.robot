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
Search Submit Order Test
    Sleep    3s
    Wait Until Element Is Visible    ${SEARCH}    ${TIMEOUT}
    Click Element    ${SEARCH}
    Wait Until Element Is Visible    ${SEARCH_BOX}    ${TIMEOUT}
    Input Text    ${SEARCH_BOX}    ${SEARCH_WORD}
    Sleep    3s
    Wait Until Element Is Visible    ${FIRST_SEARCH_RESULT}    ${TIMEOUT}
    Click Element    ${FIRST_SEARCH_RESULT}
    Wait Until Element Is Visible    ${ADD_BUTTON1}    ${TIMEOUT}
    Click Element    ${ADD_BUTTON1}
    Wait Until Element Is Visible   ${PLUS_BUTTON1}    ${TIMEOUT}
    Click Element    ${PLUS_BUTTON1}