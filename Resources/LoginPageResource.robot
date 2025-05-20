*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${products}              xpath://div[@class='header_secondary_container']//span
${error_message}         xpath://h3[@data-test='error']

*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    id:user-name    ${username}
    Input Password    id:password    ${password}
    Click Button    id:login-button


Verify the user is successfully logged in
    Element Text Should Be    ${products}    Products

Verify the user get the error message by locked
    Element Text Should Be    ${error_message}    Epic sadface: Sorry, this user has been locked out.

Verify the user get error message by empty password
    Element Text Should Be    ${error_message}    Epic sadface: Password is required

Verify the user get error message by empty username
    Element Text Should Be    ${error_message}    Epic sadface: Username is required
