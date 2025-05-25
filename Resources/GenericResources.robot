*** Settings ***
Documentation    resource file 
Library    SeleniumLibrary

*** Variables ***
${valid_username}    Admin
${valid_password}    admin123    
${url}    https://www.saucedemo.com/
${browser_name}    Edge

*** Keywords ***
Open the Browser with URL
    Create Webdriver    ${browser_name}
    Go To    ${url}
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Close browser session
    Close Browser

