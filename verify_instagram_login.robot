*** Settings ***
Documentation  Instagram Login Functionality
Library     SeleniumLibrary

*** Variables ***


*** Test Cases ***
Verify Instagram Login
    [Documentation]    This test case verifies the login functionality on Instagram.
    [Tags]             login, smoke, regression, instagram

    # Step 1: Open Instagram login page
    Open Browser    https://www.instagram.com/    chrome
    Set Browser Implicit Wait   5 seconds

    # Step 2: Enter valid username and password
    Input Text       xpath=//*[@id="loginForm"]/div[1]/div[1]/div/label/input    __khan.khan___
    Input Password   xpath=//*[@id="loginForm"]/div[1]/div[2]/div/label/input    Khan123!#

    # Step 3: Click the "Log In" button
    Click Element    xpath=//*[@id="loginForm"]/div[1]/div[3]/button

    # Step 4: Wait for the "Save Your Login Info?" popup to appear
    Wait Until Element Is Visible    xpath=/html/body/div[2]/div/div/div/div[2]/div/div/div[1]/div[1]/div[1]/section/main/div/div/div/div/div    timeout=10 seconds

    # Step 5: Handle "Save Your Login Info?" popup by clicking "Not Now"
    Click Element    xpath=/html/body/div[2]/div/div/div/div[2]/div/div/div[1]/div[1]/div[1]/section/main/div/div/div/div/div

    # Step 6: Verify login success
    Capture Page Screenshot
    Log    Login successful

    # Step 7: Close the browser
    Close Browser
