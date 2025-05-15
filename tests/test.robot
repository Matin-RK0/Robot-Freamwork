*** Settings ***
Documentation     Test
Library           SeleniumLibrary
Resource          ../variables/env_vars.robot
Resource          ../resources/common.robot
Suite Setup       Initialize Mobile Browser    
Test Setup        Go To Zoodex Mobile         
Test Teardown     Capture Page Screenshot  

*** Variables ***
${1}           css:[data-test-id="kerman-home-quick-fastfood"]

*** Test Cases ***
E2E: Mobile User Search Product And Order
    Sleep    3s
    Close Mobile Modal
    Wait Until Element Is Visible    ${1}    ${TIMEOUT}
    Click Element    ${1}

