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
Delete Cart Test
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

    Wait Until Element Is Visible   ${GO_BACK_BUTTON}    ${TIMEOUT}
    Click Element    ${GO_BACK_BUTTON}

    Wait Until Element Is Visible    ${FIRST_VENDOR}    ${TIMEOUT}
    Click Element    ${FIRST_VENDOR}

    Wait Until Element Is Visible    ${SHOW_MENU_BUTTON}    ${TIMEOUT}
    Click Element    ${SHOW_MENU_BUTTON}

    Wait Until Element Is Visible    ${MENU_TAB1}    ${TIMEOUT}
    Click Element    ${MENU_TAB1}
    Sleep    2s
    Click Element    ${MENU_TAB2}
    Sleep    2s
    Click Element    ${MENU_TAB3}
    Sleep    3s
    Click Element    ${MENU_TAB3}
    Sleep    2s
    
    Wait Until Element Is Visible    ${ADD_BUTTON2}    ${TIMEOUT}
    Click Element    ${ADD_BUTTON2}
    Wait Until Element Is Visible    ${EMPTY_CARD}    ${TIMEOUT}
    Click Button    ${EMPTY_CARD}
    Sleep    3s
    Wait Until Element Is Visible    ${PLUS_BUTTON2}    ${TIMEOUT}
    Click Element    ${PLUS_BUTTON2}
    Wait Until Element Is Visible    ${CARD_BUTTON}    ${TIMEOUT}
    Click Element    ${CARD_BUTTON}