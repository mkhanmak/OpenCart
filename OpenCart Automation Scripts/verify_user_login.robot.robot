*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}       https://awesomeqa.com/ui/
${BROWSER}   chrome

*** Test Cases ***
Verify User Login Functionality
    [Documentation]    This test case verifies the user login functionality on the website.
    ...                It checks the ability to log in with valid credentials and access the "My Account" page successfully.
    [Tags]             functional, login, smoke, regression

    # Step 1: Open the browser and navigate to the application
    Open Browser        ${URL}    ${BROWSER}
    Set Browser Implicit Wait     5 seconds
    Maximize Browser Window

    # Step 2: Navigate to "My Account" link
    Click Link          //*[@id="top-links"]/ul/li[2]/a

    # Step 3: Open the login page
    Click Link          //*[@id="top-links"]/ul/li[2]/ul/li[2]/a
    Page Should Contain     Returning Customer

    # Step 4: Enter email and password to log in
    Input Text          //*[@id="input-email"]      Johnburrow12@gmail.com
    Input Password      //*[@id="input-password"]   Johnrow12!

    # Step 5: Click the login button
    [Comment]           Submit the login form to access the account
    Click Button        //*[@id="content"]/div/div[2]/div/form/input

    # Step 6: Verify successful login
    Set Browser Implicit Wait     5 seconds
    Page Should Contain           My Account
    Capture Page Screenshot

    # Step 7: Finish the test case by closing the browser
    Close Browser

