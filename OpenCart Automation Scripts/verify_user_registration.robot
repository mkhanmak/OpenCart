*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${URL}        https://awesomeqa.com/ui/
${BROWSER}    chrome
${EMAIL}      Johnburrow12@gmail.com
${PASSWORD}   Johnrow12!

*** Test Cases ***
Verify User Registration Functionality
    [Documentation]    This test case verifies the new user registration functionality on the website, ensuring the process from filling the registration form to successful account creation.
    [Tags]             functional, registration, smoke

    # Step 1: Open the browser and navigate to the application
    Open Browser        ${URL}    ${BROWSER}
    Set Browser Implicit Wait   5 seconds
    Maximize Browser Window

    # Step 2: Navigate to "My Account" link
    Click Link          //*[@id="top-links"]/ul/li[2]/a

    # Step 3: Open the registration page
    Click Link          //*[@id="top-links"]/ul/li[2]/ul/li[1]/a

    # Step 4: Fill the registration form
    Input Text          //*[@id="input-firstname"]  John
    Input Text          //*[@id="input-lastname"]   Burrow
    Input Text          //*[@id="input-email"]      ${EMAIL}
    Input Text          //*[@id="input-telephone"]  +1 929 676 9873
    Input Password      //*[@id="input-password"]   ${PASSWORD}
    Input Password      //*[@id="input-confirm"]    ${PASSWORD}

    # Step 5: Opt out of the newsletter (radio button)
    Click Element       //*[@id="content"]/form/fieldset[3]/div/div/label[2]/input

    # Step 6: Agree to the privacy policy
    Select Checkbox     //*[@id="content"]/form/div/div/input[1]

    # Step 7: Submit the registration form
    Click Button        //*[@id="content"]/form/div/div/input[2]

    # Step 8: Verify successful account creation
    Set Browser Implicit Wait   5 seconds
    Page Should Contain     My Account
    Capture Page Screenshot

    # Step 9: Finish the test case by closing the browser
    Close Browser
