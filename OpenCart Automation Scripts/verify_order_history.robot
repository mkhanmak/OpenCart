*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${URL}        https://awesomeqa.com/ui/
${BROWSER}    chrome


*** Test Cases ***
Verify Order History

    #Start Testcase By Opening Browser
    Open Browser    ${URL}    ${BROWSER}
    Set Browser Implicit Wait   5
    Maximize Browser Window

    # Navigate to the "My Account" link
    CLick Link  //*[@id="top-links"]/ul/li[2]/a

    # # Open the login page by clicking the login link
    Click Link  //*[@id="top-links"]/ul/li[2]/ul/li[2]/a
    Page Should Contain     Returning Customer

    # Input email and password to login
    Input Text  //*[@id="input-email"]  ${EMAIL}
    Input Password      //*[@id="input-password"]   ${PASSWORD}

    # Click the login button
    Click Button    //*[@id="content"]/div/div[2]/div/form/input

    # Navigate to the "My Account" link
    CLick Link  //*[@id="top-links"]/ul/li[2]/a

    # Open History Page By Clicking The Order History Link
    Click Link  //*[@id="top-links"]/ul/li[2]/ul/li[2]/a

    # Verify that login is successful by checking for the "Order History" page
    Set Browser Implicit Wait   5
    Page Should Contain     Order History
    Capture Page Screenshot

    # Step 9: Close the browser
    Close Browser