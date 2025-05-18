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
Open Vendor Test
    Sleep    3s
    Open Vendor
    Wait Until Element Is Visible    ${VENDOR_BACK_BUTTON}    ${TIMEOUT}
    Click Element    ${VENDOR_BACK_BUTTON}