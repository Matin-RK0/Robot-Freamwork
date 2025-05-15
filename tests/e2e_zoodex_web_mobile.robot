*** Settings ***
Documentation     Mobile End-to-End User Journey: Search, Order, and Checkout on Zoodex
Library           SeleniumLibrary
Resource          ../variables/env_vars.robot
Resource          ../resources/common.robot
Suite Setup       Initialize Mobile Browser    
Test Setup        Go To Zoodex Mobile         
Test Teardown     Capture Page Screenshot  

*** Variables ***
# Search-related locators and data
${SEARCH_INPUT_FIELD}           //*[@id="__nuxt"]/div[2]/div[1]/div[3]/div[1]/div/input        
${SECOND_SEARCH_INPUT_FIELD}    //*[@id="undefined"]
${SEARCH_KEYWORD}               اسطوره                      
${FIRST_SEARCH_RESULT}          //*[@id="__nuxt"]/div[2]/div[1]/div[2]/div/div/div[3]  
${RESTAURANT_PAGE_CONTAINER}    //*[@id="__nuxt"]/div[2]/div[1]/div[5]/span   

# Food selection locators
${FOOD_CATEGORY_BUTTON}         //*[@id="nav-48005"]         
${FOOD_LIST_SECTION}            //*[@id="cat-48005"]         
${ADD_TO_CART_BUTTON}           //*[@id="48005"]/div/div/div[1]/div[2]/div[2]/div  

# Cart overlay locators
${CART_BUTTON}                  //*[@id="cart-icon"]/div  
${CART_ITEM_NAME}               //*[@id="vendors"]/div/div[2]/div[3]/div/div[1]/span  
${CART_ITEM_QUANTITY}           //*[@id="vendors"]/div/div[2]/div[3]/div/div[2]/div[2]/div/span  
${CART_REMOVE_ICON}             //*[@id="vendors"]/div/div[2]/div[3]/div/div[2]/div[2]/div/div[2]/img  
${EMPTY_CART_IMAGE}             //*[@id="__nuxt"]/section/div[2]/img       

# Order note locators
${ORDER_NOTE_FIELD}             //*[@id="vendors"]/div/div[2]/textarea 
${ORDER_NOTE_TEXT}              نوشابه مشکی                     

# Cart control locators
${CART_CLOSE_BUTTON}            //*[@id="__nuxt"]/section/div[1]/div[1]/img[1]    
${CONTINUE_SHOPPING_BUTTON}     //*[@id="__nuxt"]/section/section/div/button      

# Phone entry locators
${ENTER_PHONE_SCREEN_BUTTON}    //*[@id="__nuxt"]/div[2]/div[1]/div[3]/div/form/div/button  
${PHONE_NUMBER_FIELD}           //*[@id="شماره همراه"]        
${USER_PHONE_NUMBER}            ${PHONE_NUMBER}                

# Address selection locators
${ADDRESS_SECTION}              //*[@id="__nuxt"]/div[9]/div[2]/div  
${ADDRESS_OPTION_PRIMARY}       //*[@id="__nuxt"]/div[9]/div[2]/div/div[3]/section[1]/div[1]/div[1]  
${ADDRESS_OPTION_SECONDARY}     //*[@id="__nuxt"]/div[9]/div[2]/div/div[3]/section[1]/div[1]/div[2]  
${CHANGE_ADDRESS_BUTTON}        //*[@id="__nuxt"]/div[2]/div/div[4]/div/section[2]/button    
${ADD_NEW_ADDRESS_BUTTON}       //*[@id="__nuxt"]/div[9]/div[2]/div/div[3]/section[1]/div[2]/img  
${SELF_DELIVERY_IMAGE}      //*[@id="__nuxt"]/div[9]/div[2]/div/div[3]/div[2]/img         
${ENTER_ADDRESS_CONFIRM_BUTTON}    //*[@id="__nuxt"]/div[12]/div[2]/div/div[3]/div/section[3]/button[1]  
${ENTER_ADDRESS_CONFIRM_BUTTON_2}    //*[@id="__nuxt"]/div[9]/div[2]/div/div[3]/section[3]/button   

# Delivery time locators
${DELIVERY_TIME_SECTION}        //*[@id="__nuxt"]/section[2]/div[2]  
${SET_DELIVERY_TIME_BUTTON}     //*[@id="__nuxt"]/section[2]/div[2]/div[2]/div[2]/img      
${TIME_SELECTION_OVERLAY}       //*[@id="__nuxt"]/div[22]/div[2]/div             
${PRE_ORDER_TOGGLE}             //*[@id="__nuxt"]/div[22]/div[2]/div/div[3]/div[1]/div[2]/label[2]      
${TIME_SLOT_STEP_1}             //*[@id="__nuxt"]/div[22]/div[2]/div/div[3]/section/div/div[1]  
${TIME_SLOT_STEP_2}             //*[@id="__nuxt"]/div[22]/div[2]/div/div[3]/section[1]/div/div[2]  
${TIME_SLOT_STEP_3}             //*[@id="__nuxt"]/div[22]/div[2]/div/div[3]/section[2]/div[2]/div[2]/label    
${TIME_SLOT_STEP_4}             //*[@id="__nuxt"]/div[22]/div[2]/div/div[3]/section[2]/div[2]/div[3]/label  
${TIME_SLOT_STEP_5}             //*[@id="__nuxt"]/div[22]/div[2]/div/div[3]/section[2]/div[2]/div[4]/label  
${CONFIRM_DELIVERY_TIME_BUTTON}    //*[@id="__nuxt"]/div[22]/div[2]/div/div[3]/div[2]/button    

# Payment method locators
${PAYMENT_METHOD_SECTION}       //*[@id="__nuxt"]/section[3]/div[1]  
${PAYMENT_OPTION_CASH}          //*[@id="__nuxt"]/section[3]/div[2]/div[1]/label/span  
${PAYMENT_OPTION_DIGITAL}       //*[@id="__nuxt"]/section[3]/div[2]/div[2]/label/span  

# Utility locators
${EMPTY_SEARCH_FIELD_ICON}      //*[@id="header-desktop"]/div/section/div/section[2]/div[2]/div[1]/img  

*** Test Cases ***
E2E: Mobile User Search Product And Order
    Sleep    3s
    Close Mobile Modal
    Select Location Mobile
    Search For Restaurant
    Search For Food Category
    Add Item To Cart
    Open Cart And Verify
    Add Order Note
    Continue Shopping
    Enter Phone Number
    Sleep    ${TIMEOUT}
    Open Cart And Verify
    Continue Shopping
    Change Delivery Address
    Sleep    3s
    Change Delivery Time
    Sleep    3s
    Execute Javascript    window.scrollBy(0, 500)
    Choose Payment Method
    Cleanup Browser


*** Keywords ***
Search For Restaurant
    [Documentation]    Enter search term and select the first restaurant suggestion
    Sleep    3s
    Wait Until Element Is Visible    ${SEARCH_INPUT_FIELD}    ${TIMEOUT}
    Click Element    ${SEARCH_INPUT_FIELD}
    Sleep    5s
    Input Text    ${SECOND_SEARCH_INPUT_FIELD}    ${SEARCH_KEYWORD}
    Wait Until Element Is Visible    ${FIRST_SEARCH_RESULT}    ${TIMEOUT}
    Sleep    3s
    Click Element    ${FIRST_SEARCH_RESULT}
    Wait Until Element Is Visible    ${RESTAURANT_PAGE_CONTAINER}    ${TIMEOUT}
    Sleep    3s

Search For Food Category
    [Documentation]    Scroll to and open the food category section on the restaurant page
    
    Wait Until Element Is Visible    ${FOOD_CATEGORY_BUTTON}    ${TIMEOUT}
    Click Element    ${FOOD_CATEGORY_BUTTON}
    Sleep    5s
    Click Element    ${FOOD_CATEGORY_BUTTON}
    Wait Until Element Is Visible    ${FOOD_LIST_SECTION}    ${TIMEOUT}
    Execute Javascript    window.scrollBy(0, 100)
    Sleep    5s

Add Item To Cart
    [Documentation]    Click "Add to Cart" for the chosen food item
    Click Element    ${ADD_TO_CART_BUTTON}

Open Cart And Verify
    [Documentation]    Open cart overlay and verify the item quantity is correct
    Sleep    3s
    Click Element    ${CART_BUTTON}
    Wait Until Element Is Visible    ${CART_ITEM_NAME}    ${TIMEOUT}
    Element Should Contain    ${CART_ITEM_QUANTITY}    1

Add Order Note
    [Documentation]    Add a custom note to the order and close the cart
    Wait Until Element Is Visible    ${ORDER_NOTE_FIELD}    ${TIMEOUT}
    Input Text    ${ORDER_NOTE_FIELD}    ${ORDER_NOTE_TEXT}

Continue Shopping
    [Documentation]    Click "Continue Shopping" to return to restaurant page
    Click Button    ${CONTINUE_SHOPPING_BUTTON}

Enter Phone Number
    [Documentation]    Navigate to phone entry screen and input user phone number
    Wait Until Element Is Visible    ${PHONE_NUMBER_FIELD}    ${TIMEOUT}
    Input Text    ${PHONE_NUMBER_FIELD}    ${USER_PHONE_NUMBER}
    Click Element    ${ENTER_PHONE_SCREEN_BUTTON}
    
Change Delivery Address
    [Documentation]    Update delivery address by selecting or adding new
    Wait Until Element Is Visible    ${ADDRESS_SECTION}    ${TIMEOUT}
    Sleep    2s
    Click Element    ${ADDRESS_OPTION_SECONDARY}
    Sleep    2s
    Wait Until Element Is Visible    ${SELF_DELIVERY_IMAGE}    ${TIMEOUT}
    Click Element    ${ADDRESS_OPTION_PRIMARY}
    Sleep    2s
    Click Element    ${ADD_NEW_ADDRESS_BUTTON}
    New Location
    Sleep    6s
    Click Button    ${ENTER_ADDRESS_CONFIRM_BUTTON}
    Sleep    2s
    Wait Until Element Is Visible    ${ADDRESS_SECTION}    ${TIMEOUT}
    Sleep    2s
    Click Button    ${ENTER_ADDRESS_CONFIRM_BUTTON_2}

Change Delivery Time
    [Documentation]    Configure desired delivery time slots including pre-order option
    Wait Until Element Is Visible    ${DELIVERY_TIME_SECTION}    ${TIMEOUT}
    Click Element    ${SET_DELIVERY_TIME_BUTTON}
    Sleep    3s
    Wait Until Element Is Visible    ${TIME_SELECTION_OVERLAY}    ${TIMEOUT}
    Click Element    ${PRE_ORDER_TOGGLE}
    Click Element    ${TIME_SLOT_STEP_1}
    Click Element    ${TIME_SLOT_STEP_2}
    Click Element    ${TIME_SLOT_STEP_3}
    Click Element    ${TIME_SLOT_STEP_4}
    Click Element    ${TIME_SLOT_STEP_5}
    Click Button    ${CONFIRM_DELIVERY_TIME_BUTTON}

Choose Payment Method
    [Documentation]    Select between cash and digital payment methods and confirm
    Wait Until Element Is Visible    ${PAYMENT_METHOD_SECTION}    ${TIMEOUT}
    Sleep    3s
    Click Element    ${PAYMENT_OPTION_CASH}
    Sleep    1s
    Click Element    ${PAYMENT_OPTION_DIGITAL}
    Sleep    1s
    Click Element    ${PAYMENT_OPTION_CASH}

Empty Search Field
    [Documentation]    Clear the search input field using the clear icon
    Sleep    2s
    Click Element    ${EMPTY_SEARCH_FIELD_ICON}
    Sleep    1s

New Location
    [Documentation]    Select location on map
    Sleep    2s
    Wait Until Element Is Visible    //*[@id="__nuxt"]/div[13]/div[2]/div    ${TIMEOUT}
    Click Button    //*[@id="__nuxt"]/div[13]/div[2]/div/div[3]/section/div[2]/div[4]/button
