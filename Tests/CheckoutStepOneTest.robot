*** Settings ***
Documentation    Tests to Login
Library    SeleniumLibrary
Test Setup    Open the browser with URL
Test Teardown    Close browser session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginPageResource.robot
Resource    ../Resources/ProductpageResource.robot
Resource    ../Resources/CheckoutStepOneResource.robot
Resource    ../Resources/addtocartresource.robot
Library    DataDriver    file=../Resources/Checkoutform.xlsx    sheet_name=Sheet1
Test Template    Validate the checkout page form

*** Variables ***
${firstname}    
${lastname}    
${zipcode}

*** Test Cases ***
Validate the checkout form page    ${firstname}    ${lastname}    ${zipcode}
# logic for checkout
*** Keywords ***
Validate the checkout page form
    [Arguments]    ${firstname}    ${lastname}    ${zipcode}
    LoginPageResource.Fill the login form    username=standard_user    password=secret_sauce
    ProductpageResource.Add the Product to the cart
    addtocartresource.click the add to cart button
    addtocartresource.click the checkout button in the cart
    CheckoutStepOneResource.Fill the checkout details    ${firstname}    ${lastname}    ${zipcode}
    IF    '${firstname}' != '' and '${lastname}' == '' and '${zipcode}' == ''
        CheckoutStepOneResource.Verify the get the error message as Lastname
    ELSE IF    '${firstname}' != '' and '${lastname}' != '' and '${zipcode}' == ''
        CheckoutStepOneResource.Verify the get the error message as postcode
    ELSE IF    '${zipcode}' != '' and '${lastname}' != '' and '${firstname}' == ''
        CheckoutStepOneResource.Verify the get the error message as Firstname 
    ELSE IF    '${firstname}' == ''
        CheckoutStepOneResource.Verify the get the error message as Firstname
    ELSE IF    '${lastname}' == ''
        CheckoutStepOneResource.Verify the get the error message as Lastname
    ELSE IF    '${zipcode}' == ''
        CheckoutStepOneResource.Verify the get the error message as postcode
    ELSE IF    '${firstname}' != '' and '${zipcode}' != '' and '${lastname}' != ''
        CheckoutStepOneResource.Verify the user go to checkout finish page
    ELSE
        CheckoutStepOneResource.Verify the get the error message as Firstname  
    END

    
