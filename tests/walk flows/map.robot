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
Map Test
    Sleep    3s   
    Wait Until Element Is Visible    ${MAP}    ${TIMEOUT}
    Click Element    ${MAP}
    Sleep    3s
    Wait Until Element Is Visible    ${MAP_VENDOR}    ${TIMEOUT}
    Execute Javascript    document.getElementById('marker-vendor-Higer').click();
    Wait Until Element Is Visible    ${MAP_VENDOR_FLOAT}    ${TIMEOUT}
    Click Element    ${MAP_VENDOR_FLOAT}
    Wait Until Element Is Visible    ${VENDOR_BACK_BUTTON}    ${TIMEOUT}
    Click Element    ${VENDOR_BACK_BUTTON}