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
Favorite Section Test
    Sleep    3s
    Login User
    Click Element    ${HOME}
    Open Vendor
    Wait Until Element Is Visible    ${LIKE_VENDOR}    ${TIMEOUT}
    Click Element    ${LIKE_VENDOR}
    Click Element    ${VENDOR_BACK_BUTTON}
    Wait Until Element Is Visible    ${PROFILE}    ${TIMEOUT}
    Click Element    ${PROFILE}
    Sleep    2s
    Click Element    ${FAVORITS}
    Wait Until Element Is Visible    ${FAVORITE_VENDOR}    ${TIMEOUT}
    Sleep    2s


