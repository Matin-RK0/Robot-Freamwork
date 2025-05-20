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
Logout Test
    Sleep    3s
    Login User
    Click Element    ${PROFILE}
    Sleep    2s
    Execute Javascript    window.scrollBy(0, 200)
    Wait Until Element Is Visible    ${PROFILE_LOGOUT}    ${TIMEOUT}
    Click Element    ${PROFILE_LOGOUT}
    Wait Until Element Is Visible    ${SUBMIT_LOGOUT}    ${TIMEOUT}
    Click Element    ${SUBMIT_LOGOUT}
    Sleep    3s