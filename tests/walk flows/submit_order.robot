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
Submit Order Test
    Sleep    3s
    Go To First Vendor
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
    Sleep    3s
    Wait Until Element Is Visible    ${PLUS_BUTTON2}    ${TIMEOUT}
    Click Element    ${PLUS_BUTTON2}
    Wait Until Element Is Visible    ${CARD_BUTTON}    ${TIMEOUT}
    Click Element    ${CARD_BUTTON}
    Sleep    4s
    Wait Until Element Is Visible    ${NEGATIVE_BUTTON}    ${TIMEOUT}
    Click Element    ${NEGATIVE_BUTTON}
    Wait Until Element Is Visible    ${DESCRIPTION}    ${TIMEOUT}
    Input Text    ${DESCRIPTION}    ${DESCRIPTION_TEXT}
    Wait Until Element Is Visible    ${CONTINUE_ORDER_BUTTON}    ${TIMEOUT}
    Click Element    ${CONTINUE_ORDER_BUTTON}
    Wait Until Element Is Visible    ${PHONE_NUMBER_BOX}    ${TIMEOUT}
    Input Text    ${PHONE_NUMBER_BOX}    ${PHONE_NUMBER}
    Sleep    2s
    Wait Until Element Is Visible    ${ENTER_PH_BUTTON}    ${TIMEOUT}
    Click Element    ${ENTER_PH_BUTTON}
    Sleep    10s
    Wait Until Element Is Visible    ${1PERSON}    ${TIMEOUT}
    Sleep    3s
    Click Element    ${1PERSON}
    Click Element    ${2PERSON}
    Click Element    ${3PERSON}
    Click Element    ${4PERSON}
    FOR    ${i}    IN RANGE   1    5
        Sleep    1s
        Click Element    ${BOTTOM}
    END
    Click Button    ${ENTER_RESERVATION_BUTTON}
    Wait Until Element Is Visible    ${CHECK_BOX}    ${TIMEOUT}
    Sleep    2s
    Click Element    ${CHECK_BOX}
    Sleep    2s
    Click Element    ${CHECK_BOX}
    Execute Javascript    window.scrollBy(0, 200)
    Sleep    2s
