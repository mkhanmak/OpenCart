*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${URL}        https://awesomeqa.com/ui/
${BROWSER}    chrome
${EMAIL}      Johnburrow12@gmail.com
${PASSWORD}   Johnrow12!

*** Test Cases ***
Verify User Login and Checkout Process
    [Documentation]    This test case verifies the login functionality and the checkout process on the website, ensuring seamless navigation from login to order confirmation.
    [Tags]             smoke, login, checkout, regression

    # Step 1: Open the browser and navigate to the application
    Open Browser        ${URL}    ${BROWSER}
    Set Browser Implicit Wait   5 seconds
    Maximize Browser Window

    # Step 2: Navigate to "My Account" link
    Click Link          //*[@id="top-links"]/ul/li[2]/a

    # Step 3: Open the login page
    Click Link          //*[@id="top-links"]/ul/li[2]/ul/li[2]/a
    Page Should Contain     Returning Customer

    # Step 4: Enter login credentials
    Input Text          //*[@id="input-email"]  ${EMAIL}
    Input Password      //*[@id="input-password"]   ${PASSWORD}

    # Step 5: Click the login button and verify successful login
    Click Button        //*[@id="content"]/div/div[2]/div/form/input
    Set Browser Implicit Wait   5 seconds
    Page Should Contain     My Account

    # Step 6: Navigate back to the home page by clicking the logo
    Click Element       //*[@id="logo"]/a/img

    # Step 7: Navigate to "Phones & PDAs" section
    Click Element       //*[@id="menu"]/div[2]/ul/li[6]/a
    Page Should Contain     Phones & PDAs

    # Step 8: Select a phone product and add it to the cart
    Click Element       //*[@id="content"]/div[2]/div[1]/div/div[2]/div[1]/h4/a
    Click Button        //*[@id="button-cart"]
    Sleep              3 seconds

    # Step 9: Open the cart dropdown and proceed to checkout
    Click Button        //*[@id="cart"]/button
    Click Element       //*[@id="cart"]/ul/li[2]/div/p/a[2]/strong
    Page Should Contain     Checkout

    # Step 10: Verify and continue with billing details
    Click Button        //*[@id="button-payment-address"]

    # Step 11: Verify and continue with delivery details
    Wait Until Element Is Visible   //*[@id="collapse-shipping-address"]/div/form/div[1]/label/input
    Click Button        //*[@id="button-shipping-address"]

    # Step 12: Select delivery method and continue
    Wait Until Page Contains    Please select the preferred shipping method to use on this order.
    Click Button        //*[@id="button-shipping-method"]

    # Step 13: Agree to terms and select payment method
    Select Checkbox     //*[@id="collapse-payment-method"]/div/div[2]/div/input[1]
    Click Button        //*[@id="button-payment-method"]

    # Step 14: Confirm the order
    Wait Until Page Contains    Total:
    Click Button        //*[@id="button-confirm"]

    # Step 15: Verify order confirmation
    Wait Until Page Contains    Your order has been placed!
    Set Browser Implicit Wait   5 seconds
    Capture Page Screenshot

    # Step 16: Finish test case by closing the browser
    Close Browser


