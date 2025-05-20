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
Login Test
    Sleep    3s
    Wait Until Element Is Visible    ${NAV_LOGIN}    ${TIMEOUT}
    Click Element    ${NAV_LOGIN}
    Wait Until Element Is Visible    ${PHONE_NUMBER_BOX}    ${TIMEOUT}
    Input Text    ${PHONE_NUMBER_BOX}    ${PHONE_NUMBER}
    Wait Until Element Is Visible    ${ENTER_PH_BUTTON}    ${TIMEOUT}
    Click Element    ${ENTER_PH_BUTTON}
    Sleep    10s
    Wait Until Element Is Visible    ${PROFILE}    ${TIMEOUT}