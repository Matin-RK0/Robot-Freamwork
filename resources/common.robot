*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/env_vars.robot
Resource   ../variables/pub_variables.robot

*** Keywords ***
Initialize Browser
    Open Browser    ${ZOODEX_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.2s

*** Keywords ***
Initialize Mobile Browser
    ${mobile_emulation}    Create Dictionary    deviceName    Pixel 2
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys,selenium.webdriver
    Call Method    ${options}    add_experimental_option    mobileEmulation    ${mobile_emulation}
    Open Browser    ${WALK_URL}    ${BROWSER}    options=${options}

Cleanup Browser
    [Documentation]    Close all browsers
    Close All Browsers

Go To Zoodex
    [Documentation]    Go to zoodex URL and wait for logo
    Go To    ${ZOODEX_URL}
    Wait Until Element Is Visible    ${LOGO}    ${TIMEOUT}

Go To Zoodex Walk
    [Documentation]    Go to zoodex walk
    Go To    ${WALK_URL}

Go To Zoodex Mobile
    [Documentation]    Go to zoodex URL and wait for logo
    Go To    ${ZOODEX_URL}
    Wait Until Element Is Visible    ${ZOODEX_MOBILE_LOGO}    ${TIMEOUT}
    
Close Modal
    [Documentation]    Dismiss any modal or popup that appears on the homepage
    Wait Until Element Is Visible    ${CLOSE_MODAL_BUTTON}    ${TIMEOUT}
    Click Element    ${CLOSE_MODAL_BUTTON}

Close Mobile Modal
    [Documentation]    Dismiss any modal or popup that appears on the mobile homepage
    Wait Until Element Is Visible    ${CLOSE_MODAL_BUTTON_M}    ${TIMEOUT}
    Click Element    ${CLOSE_MODAL_BUTTON_M}

Select Location
    [Documentation]    Select location on map
    Click Element    ${LOCATION_BUTTON}
    Wait Until Element Is Visible    ${LOCATION_SECTION}    ${TIMEOUT}
    Click Button    ${SELECT_LOCATION_BUTTON}

Select Location Mobile
    [Documentation]    Select location on map
    Click Element    ${LOCATION_BUTTON_M}
    Wait Until Element Is Visible    ${LOCATION_SECTION_M}    ${TIMEOUT}
    Sleep    3s
    Click Button    ${SELECT_LOCATION_BUTTON_M}

Login User
    Sleep    3s
    Wait Until Element Is Visible    ${NAV_LOGIN}    ${TIMEOUT}
    Click Element    ${NAV_LOGIN}
    Wait Until Element Is Visible    ${PHONE_NUMBER_BOX}    ${TIMEOUT}
    Input Text    ${PHONE_NUMBER_BOX}    ${PHONE_NUMBER}
    Sleep    2s
    Wait Until Element Is Visible    ${ENTER_PH_BUTTON}    ${TIMEOUT}
    Click Element    ${ENTER_PH_BUTTON}
    Sleep    10s
    Wait Until Element Is Visible    ${PROFILE}    ${TIMEOUT}

Open Vendor
    Scroll Element Into View    ${LAST_VENDOR}
    Sleep    3s
    Wait Until Element Is Visible    ${LAST_VENDOR}    ${TIMEOUT}
    Click Element    ${LAST_VENDOR}

Go To First Vendor
    [Documentation]    Open first vendor
    Wait Until Element Is Visible    ${FIRST_VENDOR}    ${TIMEOUT}
    Click Element    ${FIRST_VENDOR}