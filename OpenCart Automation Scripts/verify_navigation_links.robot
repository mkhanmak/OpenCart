*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${URL}        https://awesomeqa.com/ui/
${BROWSER}    chrome
@{navigation_links}   Desktops   Laptops & Notebooks   Components   Tablets   Software   Phones & PDAs   Cameras   MP3 Players

*** Test Cases ***
Verify Navigation Links in Menu Bar
    [Documentation]    This test case verifies that all the navigation menu links in the navigation bar of the application are functional and lead to the correct pages.
    [Tags]             navigation, regression, smoke, menu

    # Step 1: Open the browser and navigate to the application
    Open Browser    ${URL}    ${BROWSER}
    Set Browser Implicit Wait   5 seconds
    Maximize Browser Window

    # Step 2: Verify "Desktops" Navigation Link
    Mouse Over       //*[@id="menu"]/div[2]/ul/li[1]/a
    Sleep            1 second
    Click Element    //*[@id="menu"]/div[2]/ul/li[1]/div/a
    Page Should Contain     ${navigation_links}[0]

    # Step 3: Verify "Laptops & Notebooks" Navigation Link
    Mouse Over       //*[@id="menu"]/div[2]/ul/li[2]/a
    Sleep            1 second
    Click Element    //*[@id="menu"]/div[2]/ul/li[2]/div/a
    Page Should Contain     ${navigation_links}[1]

    # Step 4: Verify "Components" Navigation Link
    Mouse Over       //*[@id="menu"]/div[2]/ul/li[3]/a
    Sleep            1 second
    Click Element    //*[@id="menu"]/div[2]/ul/li[3]/div/a
    Page Should Contain     ${navigation_links}[2]

    # Step 5: Verify "Tablets" Navigation Link
    Click Element    //*[@id="menu"]/div[2]/ul/li[4]/a
    Page Should Contain     ${navigation_links}[3]

    # Step 6: Verify "Software" Navigation Link
    Click Element    //*[@id="menu"]/div[2]/ul/li[5]/a
    Page Should Contain     ${navigation_links}[4]

    # Step 7: Verify "Phones & PDAs" Navigation Link
    Click Element    //*[@id="menu"]/div[2]/ul/li[6]/a
    Page Should Contain     ${navigation_links}[5]

    # Step 8: Verify "Cameras" Navigation Link
    Click Element    //*[@id="menu"]/div[2]/ul/li[7]/a
    Page Should Contain     ${navigation_links}[6]

    # Step 9: Verify "MP3 Players" Navigation Link
    Mouse Over       //*[@id="menu"]/div[2]/ul/li[8]/a
    Sleep            1 second
    Click Element    //*[@id="menu"]/div[2]/ul/li[8]/div/a
    Page Should Contain     ${navigation_links}[7]

    # Step 10: Finish the test case by closing the browser
    Close Browser
