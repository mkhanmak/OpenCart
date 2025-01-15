*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}        https://awesomeqa.com/ui/
${BROWSER}    chrome



*** Test Cases ***
Searching Product By Condition

     # Step 1: Open the browser and navigate to the website
    Open Browser        ${URL}    ${BROWSER}
    Set Browser Implicit Wait     5 seconds
    Maximize Browser Window

    #Setting up Condition
    Mouse Over  //*[@id="menu"]/div[2]/ul/li[1]/a
    Sleep   2s
    Click Element   //*[@id="menu"]/div[2]/ul/li[1]/div/a

    #Verifying The Results
    Page Should Contain Link    https://awesomeqa.com/ui/index.php?route=product/category&path=20
    Capture Page Screenshot

     # Step : Close the browser
    Close Browser