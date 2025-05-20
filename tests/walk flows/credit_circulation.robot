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
Credit Circulatin Test
    Sleep    3s
    Login User
    Click Element    ${PROFILE}
    Sleep    2s
    Wait Until Element Is Visible    ${PAYMENTS}    ${TIMEOUT}
    Click Element    ${PAYMENTS}
    Wait Until Element Is Visible    ${INCREASE_WALLET}    ${TIMEOUT}
    Click Element    ${INCREASE_WALLET}
    Sleep    1s
    Click Element    ${INCREASE_PRICE}
    Sleep    1s
    Click Element    ${INCREASE_PRICE}
    Sleep    1s
    Click Element    ${INCREASE_PRICE}
    Sleep    1s
    Click Element    ${DECREASE_PRICE}
    Sleep    1s
    Click Element    ${DECREASE_PRICE}
    Sleep    1s
    Click Element    ${DECREASE_PRICE}
    Sleep    1s
    Wait Until Element Is Visible    ${PRICE_5000}    ${TIMEOUT}
    Click Element    ${PRICE_5000}
    Sleep    1s
    Click Element    ${PRICE_10000}
    Sleep    1s
    Click Element    ${PRICE_20000}
    Sleep    1s
    Click Element    ${PRICE_50000}
    Sleep    1s
    Click Element    ${PRICE_100000}
    Sleep    1s
    Click Element    ${PRICE_200000}
    Sleep    1s
    Click Element    ${CLOSE_BD_POPUP_BUTTON}
    Wait Until Element Is Visible    ${TRANSFER_CREDIT}    ${TIMEOUT}
    Click Element    ${TRANSFER_CREDIT}
    Wait Until Element Is Visible    ${1}    ${TIMEOUT}
    Click Element    ${1}
    Sleep    1s
    Click Element    ${3}
    Wait Until Element Is Visible    ${TF_AMOUNT}    ${TIMEOUT}
    Input Text    ${TF_AMOUNT}    ${TEST_WORD}
    Clear Element Text    ${TF_AMOUNT}
    Wait Until Element Is Visible    ${TF_DES}    ${TIMEOUT}
    Input Text    ${TF_DES}    ${TEST_WORD}
    Clear Element Text    ${TF_DES}
    Click Element    ${CANCEL_BUTTON}
    Wait Until Element Is Visible    ${TRANSACTION}    ${TIMEOUT}
    Click Element    ${TRANSACTION}
    Sleep    2s
    Wait Until Element Is Visible    ${GO_BACK}    ${TIMEOUT}
    Click Element    ${GO_BACK}
    Sleep    2s
    Wait Until Element Is Visible    ${BANK_INFORMATION}    ${TIMEOUT}
    Click Element    ${BANK_INFORMATION}
    Wait Until Element Is Visible    ${MENU_BACK_BUTTON}    ${TIMEOUT}
    Click Element    ${MENU_BACK_BUTTON}


    
    