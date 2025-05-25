*** Settings ***
Library    SeleniumLibrary



*** Variables ***
${error_msg}         xpath://h3[@data-test='error']

*** Keywords ***
Fill the checkout details
    [Arguments]    ${firstname}    ${lastname}    ${zipcode}
    Input Text    id:first-name    ${firstname}
    Input Text    id:last-name    ${lastname}
    Input Text    id:postal-code    ${zipcode}
    Click Button    id=continue

Verify the get the error message as Firstname
    Element Text Should Be    ${error_msg}    expected=Error: First Name is required

Verify the get the error message as Lastname
    Element Text Should Be    ${error_msg}    expected=Error: Last Name is required

Verify the get the error message as postcode
    Element Text Should Be    ${error_msg}    expected=Error: Postal Code is required
    
Verify the user go to checkout finish page
    Element Text Should Be    id:finish    Finish