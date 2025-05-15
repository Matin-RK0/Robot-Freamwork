*** Settings ***
Library           SeleniumLibrary
Resource          ../variables/env_vars.robot
Resource          ../resources/common.robot
Suite Setup       Initialize Mobile Browser
Test Setup        Go To Zoodex Walk
Test Teardown     Capture Page Screenshot
Suite Teardown    Close All Browsers

*** Variables ***
${SEARCH}    id=index-search
${SEARCH_BOX}    id=search-input
${SEARCH_WORD}    پیتزا
${FIRST_SEARCH_RESULT}    id=product-532388
${ADD_BUTTON1}    id=product-add-532388
${GO_BACK_BUTTON}    id=product-detail-back
${CLOSE_SEARCH_BUTTON}    id=search-close
${PLUS_BUTTON1}    id=plus-product-532388
${FIRST_VENDOR}    id=vendor-card-GardenofMeysamKhanRestaurant
${SHOW_MENU_BUTTON}    id=vendor-index-go-to-menu
${MENU_TAB1}    id=nav-58140
${MENU_TAB2}    id=nav-58138
${MENU_TAB3}    id=nav-58129
${ADD_BUTTON2}    id=product-add-850274
${EMPTY_CARD}    id=remove-current-cart
${PLUS_BUTTON2}    id=plus-product-850274
${CARD_BUTTON}    id=vendor-menu-go-to-cart
${NEGATIVE_BUTTON}    id=minus-product-850274 
${DESCRIPTION}    id=cart-description-textarea
${DESCRIPTION_TEXT}    میز سر تایم اماده باشد
${CONTINUE_ORDER_BUTTON}    id=cart-go-to-checkout
${PHONE_NUMBER_BOX}    id=شماره همراه
${ENTER_PH_BUTTON}    id=submit-otp
${1PERSON}    id=reserve-count-1
${2PERSON}    id=reserve-count-2
${3PERSON}    id=reserve-count-3
${4PERSON}    id=reserve-count-4
${ENTER_RESERVATION_BUTTON}    id=submit-reserve
${CHECK_BOX}    id=zoodex-balance
${COMPLETE_CARD_BACK_BUTTON}    id=go-back
${TRASH_BUTTON}    id=cart-trash
${DEELTE_CARD_BUTTON}    id=cart-remove-all
${MENU_BACK_BUTTON}    id=menu-back-to
${VENDOR_BACK_BUTTON}    id=vendor-index-go-back
${PROFILE}   id=nav-user
${PERSONAL_INFORMATION}    id=prime-user
${EDIT_INFO_BUTTON}    id=profile-edit-personal-info
${EDIT_BANK_INFO_BUTTON}    id=profile-edit-bank-info
${TF_NAME}    id=نام و نام خانوادگی
${NAME}    متین رمضانی کریم
${TF_ID_CARD_NUMBER}    id=کد ملی
${TF_EMAIL}    id=پست الکترونیک
${EMAIL}    matin007.rk@gmail.com
${TF_BIRTHDAY}    id=تاریخ تولد
${ID_CARD_NUMBER}    2981441922
${SUBMIT_BUTTON}    id=submit-edit-personal-info
${CLOSE_BD_POPUP_BUTTON}    id=close-popup
${TF_BANK_CARD_NUM}    id=شماره کارت
${CARD_NUM}    5041721237791521
${SHABA_NUM}   550700010001113123044001
${TF_SHABA_NUM}    id=شماره شبا
${SUBMIT_BANK_INFORMATION_BUTTON}    id=submit-edit-bank-info
${GO_BACK}    id=go-back
${FAVORITS}    id=prime-heart
${FEEDBACKS}    id=prime-comments
${PAYMENTS}    id=prime-group
${CALL_US}    id=prime-phone
${PRIVACY}    id=prime-privacy
${ABOUT_US}    id=prime-about-us
${TICKETS}    id=prime-ticket
${HOME}    id=nav-home
${MAP}    id=nav-collections-map
${ORDERS}    id=nav-orders
${LAST_VENDOR}    id=vendor-card-GardenofMeysamKhanRestaurant
${MAP_VENDOR}    id=marker-vendor-Higer
${MAP_VENDOR_FLOAT}    id=map-vendor-Higer
${BOTTOM}    id=bottom

*** Test Cases ***
E2E: Zoodex Walk User Search Vendor And Order
    Sleep    3s
    Search ,Add Item And Doubble It
    Close Search
    Go To First Vendor
    Go To Menu Select a Food ,And Empty Order
    Add Description And Change Order ,Continue
    Login User
    Reservation And Enter Persons
    Chech Box Test
    Back To Menu Into The Cart
    Go To Profile And Personal Information ,Test Fields
    Edit Bank Information
    Return To Profile Section
    Switch Between Profile Tabs
    Switch Between Navigation Bar Items


*** Keywords ***
Search ,Add Item And Doubble It
    [Documentation]    Open search box and search , choose a item , add to cart 
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

Close Search
    [Documentation]    Return from search to home screen
    Wait Until Element Is Visible   ${GO_BACK_BUTTON}    ${TIMEOUT}
    Click Element    ${GO_BACK_BUTTON}
    #Wait Until Element Is Visible   ${CLOSE_SEARCH_BUTTON}    ${TIMEOUT}
    #Click Element    ${CLOSE_SEARCH_BUTTON}

Go To First Vendor
    [Documentation]    Open first vendor
    Wait Until Element Is Visible    ${FIRST_VENDOR}    ${TIMEOUT}
    Click Element    ${FIRST_VENDOR}


Go To Menu Select a Food ,And Empty Order
    [Documentation]    Go to vedor menu and switch between tabs ,add food to cart ,add more food ,go to card
    Wait Until Element Is Visible    ${SHOW_MENU_BUTTON}    ${TIMEOUT}
    Click Element    ${SHOW_MENU_BUTTON}
    Switch Between Menu Tabs
    Wait Until Element Is Visible    ${ADD_BUTTON2}    ${TIMEOUT}
    Click Element    ${ADD_BUTTON2}
    Wait Until Element Is Visible    ${EMPTY_CARD}    ${TIMEOUT}
    Click Button    ${EMPTY_CARD}
    Sleep    3s
    Wait Until Element Is Visible    ${PLUS_BUTTON2}    ${TIMEOUT}
    Click Element    ${PLUS_BUTTON2}
    Wait Until Element Is Visible    ${CARD_BUTTON}    ${TIMEOUT}
    Click Element    ${CARD_BUTTON}

Switch Between Menu Tabs
    [Documentation]    switch between menu tabs in vendor
    Wait Until Element Is Visible    ${MENU_TAB1}    ${TIMEOUT}
    Click Element    ${MENU_TAB1}
    Sleep    2s
    Click Element    ${MENU_TAB2}
    Sleep    2s
    Click Element    ${MENU_TAB3}
    Sleep    3s
    Click Element    ${MENU_TAB3}
    Sleep    2s

Add Description And Change Order ,Continue
    [Documentation]    Add description ,set food number to one and countinue order
    Sleep    4s
    Wait Until Element Is Visible    ${NEGATIVE_BUTTON}    ${TIMEOUT}
    Click Element    ${NEGATIVE_BUTTON}
    Wait Until Element Is Visible    ${DESCRIPTION}    ${TIMEOUT}
    Input Text    ${DESCRIPTION}    ${DESCRIPTION_TEXT}
    Wait Until Element Is Visible    ${CONTINUE_ORDER_BUTTON}    ${TIMEOUT}
    Click Element    ${CONTINUE_ORDER_BUTTON}
    
Login User
    [Documentation]    login user with manually entering verification code
    Wait Until Element Is Visible    ${PHONE_NUMBER_BOX}    ${TIMEOUT}
    Input Text    ${PHONE_NUMBER_BOX}    ${PHONE_NUMBER}
    Wait Until Element Is Visible    ${ENTER_PH_BUTTON}    ${TIMEOUT}
    Click Element    ${ENTER_PH_BUTTON}
    Sleep    15s

Reservation And Enter Persons
    [Documentation]    check persons number button and enter
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

Chech Box Test
    [Documentation]    zoodex payment check box ,check
    Wait Until Element Is Visible    ${CHECK_BOX}    ${TIMEOUT}
    Sleep    2s
    Click Element    ${CHECK_BOX}
    Sleep    2s
    Click Element    ${CHECK_BOX}

Back To Menu Into The Cart
    [Documentation]    return to menu from cart ,and click buttons
    Wait Until Element Is Visible    ${COMPLETE_CARD_BACK_BUTTON}    ${TIMEOUT}
    Click Element    ${COMPLETE_CARD_BACK_BUTTON}
    Wait Until Element Is Visible    ${TRASH_BUTTON}    ${TIMEOUT}
    Click Element    ${TRASH_BUTTON}
    Wait Until Element Is Visible    ${DEELTE_CARD_BUTTON}    ${TIMEOUT}
    Click Element    ${DEELTE_CARD_BUTTON}
    Wait Until Element Is Visible    ${MENU_TAB2}    ${TIMEOUT}
    Execute Javascript    window.scrollBy(0, -500)
    Sleep    1s
    Wait Until Element Is Visible    ${MENU_BACK_BUTTON}    ${TIMEOUT}
    Click Element    ${MENU_BACK_BUTTON}
    Wait Until Element Is Visible    ${VENDOR_BACK_BUTTON}    ${TIMEOUT}
    Click Element    ${VENDOR_BACK_BUTTON}

Go To Profile And Personal Information ,Test Fields
    [Documentation]    go to profile and change personal information
    Wait Until Element Is Visible    ${PROFILE}    ${TIMEOUT}
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

Edit Bank Information
    [Documentation]    checking text fields and press submit button
    Sleep    2s
    Wait Until Element Is Visible    ${EDIT_BANK_INFO_BUTTON}    ${TIMEOUT}
    Click Element    ${EDIT_BANK_INFO_BUTTON}
    Wait Until Element Is Visible    ${TF_BANK_CARD_NUM}    ${TIMEOUT}
    Clear Element Text    ${TF_BANK_CARD_NUM}
    Input Text    ${TF_BANK_CARD_NUM}    ${CARD_NUM}
    Clear Element Text    ${TF_SHABA_NUM}
    Input Text    ${TF_SHABA_NUM}    ${SHABA_NUM}
    Click Element    ${SUBMIT_BANK_INFORMATION_BUTTON}

Return To Profile Section
    [Documentation]    return to profile section from privacy information
    Wait Until Element Is Visible    ${MENU_BACK_BUTTON}    ${TIMEOUT}
    Click Element    ${MENU_BACK_BUTTON}
    
Switch Between Profile Tabs
    [Documentation]    check profile section tabs
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

Switch Between Navigation Bar Items
    [Documentation]    check navigation bar is working and more actions
    Wait Until Element Is Visible    ${HOME}    ${TIMEOUT}
    Click Element    ${HOME}
    Scroll To Last Vendor
    Wait Until Element Is Visible    ${MAP}    ${TIMEOUT}
    Click Element    ${MAP}
    Select Map Vendor
    Wait Until Element Is Visible    ${ORDERS}    ${TIMEOUT}
    Click Element    ${ORDERS}
    Sleep    2s
    Wait Until Element Is Visible    ${GO_BACK}    ${TIMEOUT}
    Click Element    ${GO_BACK}

Scroll To Last Vendor 
    [Documentation]    Scroll To Last Vendor and check it
    Wait Until Element Is Visible    ${SEARCH}    ${TIMEOUT}
    Execute Javascript    window.scrollBy(0, 800)
    Wait Until Element Is Visible    ${LAST_VENDOR}    ${TIMEOUT}
    Click Element    ${LAST_VENDOR}
    Wait Until Element Is Visible    ${VENDOR_BACK_BUTTON}    ${TIMEOUT}
    Click Element    ${VENDOR_BACK_BUTTON}

Select Map Vendor
    [Documentation]    check vendor in map
    Sleep    3s
    Wait Until Element Is Visible    ${MAP_VENDOR}    ${TIMEOUT}
    Execute Javascript    document.getElementById('marker-vendor-Higer').click();
    Wait Until Element Is Visible    ${MAP_VENDOR_FLOAT}    ${TIMEOUT}
    Click Element    ${MAP_VENDOR_FLOAT}
    Wait Until Element Is Visible    ${VENDOR_BACK_BUTTON}    ${TIMEOUT}
    Click Element    ${VENDOR_BACK_BUTTON}