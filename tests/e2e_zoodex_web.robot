*** Settings ***
Documentation     End-to-End User Journey: Search, Order, and Checkout on Zoodex
Library           SeleniumLibrary
Resource          ../variables/env_vars.robot
Resource          ../resources/common.robot
Suite Setup       Initialize Browser    # Launch browser before test suite
Test Setup        Go To Zoodex          # Navigate to Zoodex homepage before each test
Test Teardown     Capture Page Screenshot  # Capture screenshot on test completion

*** Variables ***
# Search-related locators and data
${SEARCH_INPUT_FIELD}           //*[@id="undefined"]        # Search text field on homepage
${SEARCH_KEYWORD}               اسطوره                      # Keyword to search for restaurant
${FIRST_SEARCH_RESULT}          //*[@id="header-desktop"]/div/section/div/section[2]/div[2]/div[2]/div[2]/section[1]/div[2]  # First suggestion in dropdown
${RESTAURANT_PAGE_CONTAINER}   //*[@id="__nuxt"]/div[2]/div   # Restaurant page main container

# Food selection locators
${FOOD_CATEGORY_BUTTON}         //*[@id="__nuxt"]/div[2]/div/div[4]/div[1]/div[2]/div/div[4]/span  # "Food" tab/button
${FOOD_LIST_SECTION}            //*[@id="cat-48005"]         # Section containing food items
${ADD_TO_CART_BUTTON}           //*[@id="48005"]/div/div/div[1]/div[2]/div[2]/div  # "Add to Cart" for specific item

# Cart overlay locators
${CART_BUTTON}                  //*[@id="header-desktop"]/div/section/div/section[3]/div  # Open cart icon/button
${CART_ITEM_NAME}               //*[@id="vendors"]/div/div[2]/div[3]/div/div[1]/span  # Name of item in cart
${CART_ITEM_QUANTITY}           //*[@id="vendors"]/div/div[2]/div[3]/div/div[2]/div[2]/div/span  # Quantity display
${CART_REMOVE_ICON}             //*[@id="vendors"]/div/div[2]/div[3]/div/div[2]/div[2]/div/div[2]/img  # Trash icon
${EMPTY_CART_IMAGE}             //*[@id="cart"]/div[2]/img       # "Empty cart" image

# Order note locators
${ORDER_NOTE_FIELD}             //*[@id="vendors"]/div/div[2]/textarea  # Text area for custom note
${ORDER_NOTE_TEXT}              نوشابه مشکی                     # Example order note text

# Cart control locators
${CART_CLOSE_BUTTON}            //*[@id="cart"]/div[1]/div[1]/img[1]  # Close cart button
${CONTINUE_SHOPPING_BUTTON}     //*[@id="cart"]/section/div/button  # "Continue Shopping"

# Phone entry locators
${ENTER_PHONE_SCREEN_BUTTON}    //*[@id="__nuxt"]/div[2]/div/div[3]/div/form/div/button    # Button to enter phone
${PHONE_NUMBER_FIELD}           //*[@id="شماره همراه"]          # Phone input field
${USER_PHONE_NUMBER}            ${PHONE_NUMBER}                # Imported from env_vars

# Address selection locators
${ADDRESS_SECTION}              //*[@id="__nuxt"]/div[2]/div/div[4]/div  # Address selection area
${ADDRESS_OPTION_PRIMARY}       //*[@id="__nuxt"]/div[2]/div/div[4]/div/section[1]/div[1]/div[1]  # First saved address
${ADDRESS_OPTION_SECONDARY}     //*[@id="__nuxt"]/div[2]/div/div[4]/div/section[1]/div[1]/div[2]  # Second saved address
${CHANGE_ADDRESS_BUTTON}        //*[@id="__nuxt"]/div[2]/div/div[4]/div/section[1]/div[2]/span    # Button to change address
${ADD_NEW_ADDRESS_BUTTON}       //*[@id="__nuxt"]/div[2]/div/div[4]/div/section[1]/div[2]/img    # "Add New Address"
${NEW_ADDRESS_TITLE_FIELD}      //*[@id="undefined"]     # Title input for new address
${ENTER_ADDRESS_CONFIRM_BUTTON}    //*[@id="__nuxt"]/div[3]/div/div[2]/section[3]/button[1]    # Confirm new address
${ENTER_ADDRESS_CONFIRM_BUTTON_2}    //*[@id="__nuxt"]/div[2]/div/div[4]/div/section[3]/button   # Confirm new address

# Delivery time locators
${DELIVERY_TIME_SECTION}        //*[@id="__nuxt"]/div[2]/div/section/section/section[2]/div[2]  # Delivery time options
${SET_DELIVERY_TIME_BUTTON}     //*[@id="__nuxt"]/div[2]/div/section/section/section[2]/div[2]/div[2]/div[2]/span  # "Set Time"
${TIME_SELECTION_OVERLAY}       //*[@id="__nuxt"]/div[4]/div             # Time picker overlay
${PRE_ORDER_TOGGLE}             //*[@id="__nuxt"]/div[4]/div/div[3]/div[2]/label[2]  # Pre-order toggle
${TIME_SLOT_STEP_1}             //*[@id="__nuxt"]/div[4]/div/section[1]/div/div[1]  # Step 1 time slot
${TIME_SLOT_STEP_2}             //*[@id="__nuxt"]/div[4]/div/section[1]/div/div[2]  # Step 2 time slot
${TIME_SLOT_STEP_3}             //*[@id="__nuxt"]/div[4]/div/section[2]/div[2]/div[2]/div/label/span  # Step 3
${TIME_SLOT_STEP_4}             //*[@id="__nuxt"]/div[4]/div/section[2]/div[2]/div[3]/div/label/span  # Step 4
${TIME_SLOT_STEP_5}             //*[@id="__nuxt"]/div[4]/div/section[2]/div[2]/div[4]/div/label/span  # Step 5
${CONFIRM_DELIVERY_TIME_BUTTON}    //*[@id="__nuxt"]/div[4]/div/div[4]/button  # Confirm time selection

# Payment method locators
${PAYMENT_METHOD_SECTION}       //*[@id="__nuxt"]/div[2]/div/section/section/section[3]/div[2]  # Payment options area
${PAYMENT_OPTION_CASH}          //*[@id="__nuxt"]/div[2]/div/section/section/section[3]/div[2]/div[1]/label/span  # Cash on delivery
${PAYMENT_OPTION_DIGITAL}       //*[@id="__nuxt"]/div[2]/div/section/section/section[3]/div[2]/div[2]/label/span  # Digital payment

# Utility locators
${EMPTY_SEARCH_FIELD_ICON}      //*[@id="header-desktop"]/div/section/div/section[2]/div[2]/div[1]/img  # "Clear search" icon

*** Test Cases ***
E2E: User Search Product And Order
    [Documentation]    Full end-to-end flow: search restaurant, select food, add note, checkout
    Close Initial Modal
    Select Location
    Search For Restaurant
    Search For Food Category
    Add Item To Cart
    Open Cart And Verify
    Add Order Note
    Continue Shopping
    Close Order Section
    Enter Phone Number
    Sleep    ${TIMEOUT}
    Empty Search Field
    Open Cart And Verify
    Continue Shopping
    Change Delivery Address
    Change Delivery Time
    Choose Payment Method
    Cleanup Browser

*** Keywords ***
Close Initial Modal
    [Documentation]    Dismiss any modal or popup that appears on the homepage
    Run Keyword And Ignore Error    Click Element    ${CLOSE_MODAL_BUTTON}

Search For Restaurant
    [Documentation]    Enter search term and select the first restaurant suggestion
    Input Text    ${SEARCH_INPUT_FIELD}    ${SEARCH_KEYWORD}
    Wait Until Element Is Visible    ${FIRST_SEARCH_RESULT}    ${TIMEOUT}
    Click Element    ${FIRST_SEARCH_RESULT}
    Wait Until Element Is Visible    ${RESTAURANT_PAGE_CONTAINER}    ${TIMEOUT}

Search For Food Category
    [Documentation]    Scroll to and open the food category section on the restaurant page
    Execute Javascript    window.scrollBy(0, 500)
    Wait Until Element Is Visible    ${FOOD_CATEGORY_BUTTON}    ${TIMEOUT}
    Click Element    ${FOOD_CATEGORY_BUTTON}
    Wait Until Element Is Visible    ${FOOD_LIST_SECTION}    ${TIMEOUT}

Add Item To Cart
    [Documentation]    Click "Add to Cart" for the chosen food item
    Click Element    ${ADD_TO_CART_BUTTON}

Open Cart And Verify
    [Documentation]    Open cart overlay and verify the item quantity is correct
    Sleep    2s
    Click Element    ${CART_BUTTON}
    Wait Until Element Is Visible    ${CART_ITEM_NAME}    ${TIMEOUT}
    Element Should Contain    ${CART_ITEM_QUANTITY}    1

Add Order Note
    [Documentation]    Add a custom note to the order and close the cart
    Wait Until Element Is Visible    ${ORDER_NOTE_FIELD}    ${TIMEOUT}
    Input Text    ${ORDER_NOTE_FIELD}    ${ORDER_NOTE_TEXT}

Continue Shopping
    [Documentation]    Click "Continue Shopping" to return to restaurant page
    Sleep    2s
    Click Button    ${CONTINUE_SHOPPING_BUTTON}

Close Order Section
    Click Element    ${CART_CLOSE_BUTTON}

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
    Wait Until Element Is Visible    ${NEW_ADDRESS_TITLE_FIELD}    ${TIMEOUT}
    Click Element    ${ADDRESS_OPTION_PRIMARY}
    Sleep    2s
    Click Element    ${ADD_NEW_ADDRESS_BUTTON}
    New Location
    Sleep    6s
    Click Button    ${ENTER_ADDRESS_CONFIRM_BUTTON}
    Wait Until Element Is Visible    ${ADDRESS_SECTION}    ${TIMEOUT}
    Click Button    ${ENTER_ADDRESS_CONFIRM_BUTTON_2}

Change Delivery Time
    [Documentation]    Configure desired delivery time slots including pre-order option
    Wait Until Element Is Visible    ${DELIVERY_TIME_SECTION}    ${TIMEOUT}
    Click Element    ${SET_DELIVERY_TIME_BUTTON}
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
    Wait Until Element Is Visible    ${LOCATION_SECTION}    ${TIMEOUT}
    Click Button    ${SELECT_LOCATION_BUTTON}