*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${URL}        https://awesomeqa.com/ui/
${BROWSER}    chrome

*** Test Cases ***
Verify Add To Cart And Coupon Section

    # Step 1: Open the browser and navigate to the application
    Open Browser    ${URL}    ${BROWSER}
    Set Browser Implicit Wait   5
    Maximize Browser Window

    #Add Product To Cart MacBook
    Scroll Element Into View    //*[@id="content"]/div[2]/div[1]/div/div[3]/button[1]
    Click Button    //*[@id="content"]/div[2]/div[1]/div/div[3]/button[1]

    #Open Shopping Cart
    Click Element    //*[@id="top-links"]/ul/li[4]/a/i
    Wait Until Page Contains     Shopping Cart

    #Verify The Use Coupon Code Section
    Click Element     //*[@id="accordion"]/div[1]/div[1]/h4/a
    Input Text      //*[@id="input-coupon"]     URRHDB
    Click Button    //*[@id="button-coupon"]

    ##Verifying The Results
    Wait Until Page Contains    Coupon is either invalid
    Set Browser Implicit Wait   5
    Capture Page Screenshot

     # Step 9: Close the browser
    Close Browser
