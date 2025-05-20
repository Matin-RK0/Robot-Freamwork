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
Profile Tab Test
    Sleep    3s
    Login User
    Click Element    ${PROFILE}
    Sleep    2s
    Wait Until Element Is Visible    ${PERSONAL_INFORMATION}    ${TIMEOUT}
    Click Element    ${PERSONAL_INFORMATION}
    Sleep    2s
    Wait Until Element Is Visible    ${MENU_BACK_BUTTON}    ${TIMEOUT}
    Click Element    ${MENU_BACK_BUTTON}

    Wait Until Element Is Visible    ${FAVORITS}    ${TIMEOUT}
    Click Element    ${FAVORITS}
    Wait Until Element Is Visible    ${GO_BACK}    ${TIMEOUT}
    Click Element    ${GO_BACK}

    Wait Until Element Is Visible    ${FEEDBACKS}    ${TIMEOUT}
    Click Element    ${FEEDBACKS}
    Wait Until Element Is Visible    ${GO_BACK}    ${TIMEOUT}
    Click Element    ${GO_BACK}

    Wait Until Element Is Visible    ${PAYMENTS}    ${TIMEOUT}
    Click Element    ${PAYMENTS}
    Wait Until Element Is Visible    ${GO_BACK}    ${TIMEOUT}
    Click Element    ${GO_BACK}

    Wait Until Element Is Visible    ${CALL_US}    ${TIMEOUT}
    Click Element    ${CALL_US}
    Wait Until Element Is Visible    ${GO_BACK}    ${TIMEOUT}
    Click Element    ${GO_BACK}

    Wait Until Element Is Visible    ${PRIVACY}    ${TIMEOUT}
    Click Element    ${PRIVACY}
    Wait Until Element Is Visible    ${GO_BACK}    ${TIMEOUT}
    Click Element    ${GO_BACK}
    
    Wait Until Element Is Visible    ${ABOUT_US}    ${TIMEOUT}
    Click Element    ${ABOUT_US}
    Wait Until Element Is Visible    ${GO_BACK}    ${TIMEOUT}
    Click Element    ${GO_BACK}
        
    Wait Until Element Is Visible    ${TICKETS}    ${TIMEOUT}
    Click Element    ${TICKETS}
    Wait Until Element Is Visible    ${GO_BACK}    ${TIMEOUT}
    Click Element    ${GO_BACK}
