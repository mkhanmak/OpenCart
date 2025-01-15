*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}        https://awesomeqa.com/ui/
${BROWSER}    chrome
${FILE}       /Users/mak../Desktop/Screenshot\ .png
${HOMELINK}   //*[@id="logo"]/a/img

*** Test Cases ***
Verify Adding Multiple Products To Cart From Home Page
    [Documentation]    This test case verifies the functionality of adding various products to the shopping cart from the home page.
    ...                It includes testing radio buttons, checkboxes, dropdowns, file upload, and date/time inputs during the process.
    [Tags]             functional, cart, regression, smoke

    # Step 1: Open the browser and navigate to the website
    Open Browser        ${URL}    ${BROWSER}
    Set Browser Implicit Wait     5 seconds
    Maximize Browser Window

    # Step 3: Add MacBook to the cart

    Click Link          //*[@id="content"]/div[2]/div[1]/div/div[2]/h4/a
    Click Button        //*[@id="button-cart"]
    Click Element       ${HOMELINK}

    # Step 4: Add iPhone to the cart

    Click Link          //*[@id="content"]/div[2]/div[2]/div/div[2]/h4/a
    Click Button        //*[@id="button-cart"]
    Click Element       ${HOMELINK}

    # Step 5: Add Apple Cinema 30 to the cart with various options
    Click Link          //*[@id="content"]/div[2]/div[3]/div/div[2]/h4/a

    # Select the 'Medium' radio button and verify
    Click Element       //*[@id="input-option218"]/div[2]/label/input
    ${selected}         Get Element Attribute    //*[@id="input-option218"]/div[2]/label/input    checked
    Should Be Equal As Strings    ${selected}    true

    # Select a checkbox
    Scroll Element Into View    //*[@id="input-option223"]/div[2]/label/input
    Select Checkbox             //*[@id="input-option223"]/div[2]/label/input

    # Provide text input
    Input Text          //*[@id="input-option208"]      mak

    # Select from a dropdown and verify
    Scroll Element Into View    //*[@id="input-option217"]
    Select From List By Label   //*[@id="input-option217"]  Green (+$1.20)
    ${selected}         Get Selected List Label    //*[@id="input-option217"]
    Should Be Equal As Strings    ${selected}    Green (+$1.20)

    # Provide text in a textarea
    Input Text          //*[@id="input-option209"]      On Top Side

    # Upload a file
    Choose File         //*[@id="button-upload222"]     ${FILE}


    # Input date, time, and datetime values
    Input Text          //*[@id="input-option219"]      2024-12-27
    Input Text          //*[@id="input-option221"]      11:47
    Input Text          //*[@id="input-option220"]      2024-12-27 11:47

    # Add the product to the cart
    Click Button        //*[@id="button-cart"]
    Scroll Element Into View    //*[@id="button-cart"]
    Click Element       ${HOMELINK}

    # Take a screenshot and close the browser
    Set Browser Implicit Wait     5 seconds
    Capture Page Screenshot


    Close Browser
