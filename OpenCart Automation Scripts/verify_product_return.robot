*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${URL}        https://awesomeqa.com/ui/
${BROWSER}    chrome
${EMAIL}      Johnburrow12@gmail.com
${PASSWORD}   Johnrow12!

*** Test Cases ***
Verify Product Return Functionality
    [Documentation]    This test case verifies the process of logging in, navigating order history, and submitting a product return request.
    [Tags]             product_return, regression, login, navigation

    # Step 1: Open the browser and navigate to the application
    Open Browser    ${URL}    ${BROWSER}
    Set Browser Implicit Wait   5 seconds
    Maximize Browser Window

    # Step 2: Navigate to the "My Account" section
    Click Link    //*[@id="top-links"]/ul/li[2]/a

    # Step 3: Open the login page
    Click Link    //*[@id="top-links"]/ul/li[2]/ul/li[2]/a
    Page Should Contain    Returning Customer

    # Step 4: Log in with valid credentials
    Input Text       //*[@id="input-email"]        ${EMAIL}
    Input Password   //*[@id="input-password"]     ${PASSWORD}
    Click Button     //*[@id="content"]/div/div[2]/div/form/input

    # Step 5: Navigate back to "My Account" section
    Click Link    //*[@id="top-links"]/ul/li[2]/a

    # Step 6: Access the "Order History" page
    Click Link    //*[@id="top-links"]/ul/li[2]/ul/li[2]/a
    Set Browser Implicit Wait   5 seconds
    Page Should Contain    Order History

    # Step 7: View a specific order from the history
    Click Link    //*[@id="content"]/div[1]/table/tbody/tr[3]/td[7]/a

    # Step 8: Initiate a product return
    Click Link    //*[@id="content"]/div[1]/table/tbody/tr/td[6]/a[2]

    # Step 9: Fill out the product return form
    ## Select reason for return
    Scroll Element Into View    //*[@id="content"]/form/fieldset[2]/div[4]/div/div[3]/label/input
    Click Button                //*[@id="content"]/form/fieldset[2]/div[4]/div/div[3]/label/input

    ## Indicate product is not open (select "No")
    Scroll Element Into View    //*[@id="content"]/form/fieldset[2]/div[5]/div/label[2]/input
    Click Element               //*[@id="content"]/form/fieldset[2]/div[5]/div/label[2]/input

    ## Provide additional comments
    Input Text    //*[@id="input-comment"]    This order did not open and was an error.

    # Step 10: Submit the product return request
    Click Button    //*[@id="content"]/form/div/div[2]/input

    # Step 11: Verify successful submission by capturing the screen
    Set Browser Implicit Wait   5 seconds
    Capture Page Screenshot

    # Step 12: Close the browser
    Close Browser
