*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${URL}        https://awesomeqa.com/ui/
${BROWSER}    chrome


*** Test Cases ***
Verify Currency Switcher

    #Start Testcase By Opening Browser
    Open Browser    ${URL}    ${BROWSER}
    Set Browser Implicit Wait   5
    Maximize Browser Window

    #Open Currency Switcher
    Click Button   //*[@id="form-currency"]/div/button
    Wait Until Element Is Visible   //*[@id="form-currency"]/div/ul/li[1]/button    timeout=10

    #Select Currency (EURO)
    Click Element   //*[@id="form-currency"]/div/ul/li[1]/button

    #Verify The Currency Update
    Page Should Contain     0.00€
    Capture Page Screenshot

    #Open Currency Switcher
    Click Button   //*[@id="form-currency"]/div/button
    Wait Until Element Is Visible   //*[@id="form-currency"]/div/ul/li[2]/button    timeout=10

    #Select Currency (Pound sterling  £)
    Click Element   //*[@id="form-currency"]/div/ul/li[2]/button

    #Verify The Currency Update
    Page Should Contain     £0.00
    Capture Page Screenshot

     # Step 9: Close the browser
    Close Browser