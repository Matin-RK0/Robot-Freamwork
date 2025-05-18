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
Personal Information
    Sleep    3s
    Login User
    Click Element    ${PROFILE}
    Sleep    2s
    Wait Until Element Is Visible    ${PERSONAL_INFORMATION}    ${TIMEOUT}
    Click Element    ${PERSONAL_INFORMATION}
    Wait Until Element Is Visible    ${EDIT_INFO_BUTTON}    ${TIMEOUT}
    Click Element    ${EDIT_INFO_BUTTON}
    Wait Until Element Is Visible    ${TF_NAME}    ${TIMEOUT}
    Clear Element Text    ${TF_NAME}
    Input Text    ${TF_NAME}    ${NAME}
    Clear Element Text    ${TF_ID_CARD_NUMBER}
    Input Text    ${TF_ID_CARD_NUMBER}    ${ID_CARD_NUMBER}
    Clear Element Text    ${TF_EMAIL}
    Click Element    ${TF_BIRTHDAY}
    FOR    ${i}    IN RANGE    1    30
        Click Element    id=day-${i}
    END
    Click Element    ${CLOSE_BD_POPUP_BUTTON}
    Wait Until Element Is Visible    ${SUBMIT_BUTTON}    ${TIMEOUT}
    Click Element    ${SUBMIT_BUTTON}
    Sleep    2s
    Wait Until Element Is Visible    ${EDIT_BANK_INFO_BUTTON}    ${TIMEOUT}
    Click Element    ${EDIT_BANK_INFO_BUTTON}
    Wait Until Element Is Visible    ${TF_BANK_CARD_NUM}    ${TIMEOUT}
    Clear Element Text    ${TF_BANK_CARD_NUM}
    Input Text    ${TF_BANK_CARD_NUM}    ${CARD_NUM}
    Clear Element Text    ${TF_SHABA_NUM}
    Input Text    ${TF_SHABA_NUM}    ${SHABA_NUM}
    Click Element    ${SUBMIT_BANK_INFORMATION_BUTTON}