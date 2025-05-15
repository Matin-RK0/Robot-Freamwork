* Settings *
Library           AppiumLibrary

* Variables *
${TIMEOUT}                    15s
${SEARCH}                     accessibility_id=جستجو 
${AIDA}                       accessibility_id=مجموعه آیدا\n4\n(امتیاز عملکرد 2739)\nبلوار جمهوری
${KHOB_MAN}                   accessibility_id=فست فود خوب من\n4\n(امتیاز عملکرد 647)\nبلوار امیرکبیر
${CONTENT}                    accessibility_id=محتوا
${FEEDBACKS}                  accessibility_id=نظرات
${INFORMATION}                accessibility_id=اطلاعات
${RESERVATION_BUTTON}         accessibility_id=ثبت سفارش و رزرو میز
${FOOD_TAB}                   accessibility_id=پیتزا امریکایی
${FOOD_TAB2}                  accessibility_id=پیتزا خانواده
${ADD_TO_CART}                xpath=//android.view.View[@bounds='[56,1193][397,1375]']
${ADD_TO_CART2}               xpath=//android.view.View[@bounds='[56,785][397,967]']
${CH1}                        xpath=//android.widget.CheckBox[6]
${CH2}                        xpath=//android.widget.CheckBox[4]
${CH3}                        xpath=//android.widget.CheckBox[3]
${ENTER_BUTTON}               accessibility_id=تایید
${CART}                       xpath=//android.widget.Button[@bounds='[56,2889][1384,3064]']
${DESCRIPTION}                xpath=//android.widget.EditText[@bounds='[28,1499][1412,2003]']
${DESCRIPTION_TEXT}           به موقع اماده شه
${CART_BACK_BUTTON}           xpath=//android.widget.Button[@bounds='[1258,127][1426,295]']
${MENU_BACK_BUTTON}           xpath=//android.widget.Button[@bounds='[1258,127][1426,295]']
${CAVARO}                     xpath=//android.view.View[@bounds='[614,1690][1412,2626]']
${EMPTY_CARD}                 xpath=//android.view.View[@bounds='[28,2968][545,3041]']
${RESERVATION_TABLE}          accessibility_id=رزرو میز (اجباری)
${CLOSE_RESERVATION_TABLE}    accessibility_id=ثبت
${2PERSON}                    accessibility_id=2
${3PERSON}                    accessibility_id=3
${4PERSON}                    accessibility_id=4
${NUMBER_TF}                  xpath=//android.widget.EditText[@bounds='[56,2490][1384,2658]']
${PHONE_NUMBER}               09130424612
${ENTER_PH_BUTTON}            accessibility_id=ادامه

* Test Cases *
E2E: App User Search, Product Select and Order
    [Documentation]    This test automates the complete user journey:
    ...    - Launching the application and finding the Vendor.
    ...    - Navigating through Vendor details and reservation options.
    ...    - Adding the product to the cart and entering order.
    ...    - Finalizing the reservation and order, closing the app.
    Launch Application And Find Vendor
    Navigate Product Details And Reservation
    Add Product To Cart And Confirm Order
    Finalize Order
    Back And Order Again

* Keywords *
Launch Application And Find Vendor
    [Documentation]    Launches the application, performs search initialization, swipes, and selects the target product.
    Open Application    
    ...    http://localhost:4723
    ...    platformName=Android    
    ...    deviceName=R5CX912W94J    
    ...    appPackage=com.example.zoodex_walk    
    ...    appActivity=.MainActivity    
    ...    automationName=Uiautomator2
    Wait Until Element Is Visible    ${SEARCH}    ${TIMEOUT}
    Swipe    540    1800    540    200    200
    Wait Until Element Is Visible    ${AIDA}    ${TIMEOUT}
    Click Element    ${AIDA}

Navigate Product Details And Reservation
    [Documentation]    Accesses product details and navigates to the reservation section.
    Wait Until Element Is Visible    ${CONTENT}    ${TIMEOUT}
    Click Element    ${CONTENT}
    Click Element    ${FEEDBACKS}
    Click Element    ${INFORMATION}
    Click Element    ${RESERVATION_BUTTON}
    Wait Until Element Is Visible    ${FOOD_TAB}    ${TIMEOUT}
    Click Element    ${FOOD_TAB}
    Sleep    2s
    
Add Product To Cart And Confirm Order
    [Documentation]    Selects customization options, adds the product to the cart, and fills in order details.
    Click Element    ${ADD_TO_CART}
    Wait Until Element Is Visible    ${CART}    ${TIMEOUT}
    Click Element    ${CART}
    Wait Until Element Is Visible    ${NUMBER_TF}    ${TIMEOUT}
    Click Element    ${NUMBER_TF}
    Input Text Into Current Element    ${PHONE_NUMBER}
    Click Element    ${ENTER_PH_BUTTON}
    Sleep    10s

Finalize Order
    [Documentation]    Finalizes the reservation by selecting person options, and closes the application.
    Click Element    ${RESERVATION_TABLE}
    Sleep    1s
    Click Element    ${2PERSON}
    Click Element    ${3PERSON}
    Click Element    ${4PERSON}
    Swipe    600    2700    600    2200    150
    Sleep    3s
    Click Element    ${CLOSE_RESERVATION_TABLE}
    Sleep    2s

Back And Order Again
    [Documentation]    Check cart is empty and order again.
    Go Back
    Sleep    2s
    Go Back
    Sleep    2s
    Go Back
    Wait Until Element Is Visible    ${KHOB_MAN}    ${TIMEOUT}
    Click Element    ${KHOB_MAN}
    Wait Until Element Is Visible    ${RESERVATION_BUTTON}    ${TIMEOUT}
    Click Element    ${RESERVATION_BUTTON}
    Wait Until Element Is Visible    ${FOOD_TAB2}    ${TIMEOUT}
    Click Element    ${FOOD_TAB2}
    Click Element    ${ADD_TO_CART2}
    Sleep    2s
    Click Element    ${EMPTY_CARD}
    Sleep    2s
    Click Element    ${ADD_TO_CART2}
    Wait Until Element Is Visible    ${CART}    ${TIMEOUT}
    Click Element    ${CART}
    Sleep    3s
    Close Application


