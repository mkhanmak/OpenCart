*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}         https://awesomeqa.com/ui/
${BROWSER}     chrome
${SEARCH_TEXT}  Headphones & Earbuds

*** Test Cases ***
Verify Search Functionality
    [Documentation]    This test case verifies the basic search functionality on the website.
    ...                It ensures the search field accepts input, performs the search, and displays relevant results.
    [Tags]             functional, search, smoke

    # Step 1: Open the browser and navigate to the application
    Open Browser        ${URL}    ${BROWSER}
    Set Browser Implicit Wait     5 seconds
    Maximize Browser Window

    # Step 2: Input search text and perform the search
    Input Text          //*[@id="search"]/input     ${SEARCH_TEXT}
    Press Keys          //*[@id="search"]/input     RETURN

    # Step 3: Verify the search results
    Wait Until Page Contains     ${SEARCH_TEXT}    timeout=10 seconds
    Capture Page Screenshot

    # Step 4: Finish the test case by closing the browser
    Close Browser
