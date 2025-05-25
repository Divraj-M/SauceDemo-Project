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
Library    DataDriver    file=C:/Users/Lenovo/Desktop/SauceDemo-Project/Resources/Checkoutform.xlsx    sheet_name=Sheet1
Test Template    Validate the checkout page form

*** Variables ***
${firstname}    
${lastname}    
${zipcode}

*** Test Cases ***
Validate the checkout form page    ${firstname}    ${lastname}    ${zipcode}

*** Keywords ***
Validate the checkout page form
    [Arguments]    ${firstname}    ${lastname}    ${zipcode}
    LoginPageResource.Fill the login form    username=standard_user    password=secret_sauce
    ProductpageResource.Add the Product to the cart
    addtocartresource.click the add to cart button
    addtocartresource.click the checkout button in the cart
    CheckoutStepOneResource.Fill the checkout details    ${firstname}    ${lastname}    ${zipcode}
    IF    len('${firstname}') == 0 and len('${lastname}') == 0
        CheckoutStepOneResource.Verify the get the error message as postcode
    ELSE IF    len($firstname) == 0 and len($zipcode) == 0
        CheckoutStepOneResource.Verify the get the error message as Lastname
    ELSE IF    len($zipcode) == 0 and len($lastname) == 0
        CheckoutStepOneResource.Verify the get the error message as Firstname 
    ELSE IF    len($firstname) == 0
        CheckoutStepOneResource.Verify the get the error message as Firstname
    ELSE IF    len($lastname) == 0
        CheckoutStepOneResource.Verify the get the error message as Lastname
    ELSE IF    len($zipcode) == 0
        CheckoutStepOneResource.Verify the get the error message as postcode
    ELSE IF    len($firstname) == 0 and len($zipcode) == 0 and len($lastname) == 0
        CheckoutStepOneResource.Verify the get the error message as Firstname
    ELSE
        CheckoutStepOneResource.Verify the user go to checkout finish page     
    END
    
