*** Settings ***
Documentation    add to cart tests
Library    SeleniumLibrary
Resource    ../Resources/addtocartresource.robot
Resource    ../Resources/LoginPageResource.robot
Resource    ../Resources/ProductpageResource.robot
Resource    ../Resources/GenericResources.robot
Test Setup    Open the Browser with URL
Test Teardown    Close browser session


*** Test Cases ***
Verify the product is added to cart
    [Tags]    addtocart
    LoginPageResource.Fill the login form    username=standard_user    password=secret_sauce
    ProductpageResource.Add the Product to the cart
    addtocartresource.click the add to cart button
    Element Text Should Be    locator=//div[@class='inventory_item_name']    expected=Sauce Labs Bike Light

Verify the product is remove in the cart
    [Tags]    removefromcart
    LoginPageResource.Fill the login form    username=standard_user    password=secret_sauce
    ProductpageResource.Add the Product to the cart
    addtocartresource.click the add to cart button
    addtocartresource.click the remove button in the cart
    Element Should Not Be Visible    locator=//div[@class='inventory_item_name']

Verify the user is continue the shopping
    [Tags]    continueshopping
    LoginPageResource.Fill the login form    username=standard_user    password=secret_sauce
    ProductpageResource.Add the Product to the cart
    addtocartresource.click the add to cart button
    addtocartresource.click the continue shopping button
    Element Text Should Be    ${products}    Products

Verify the product is add to cart and checkoutone
    [Tags]    checkoutone
    LoginPageResource.Fill the login form    username=standard_user    password=secret_sauce
    ProductpageResource.Add the Product to the cart
    addtocartresource.click the add to cart button
    Element Text Should Be    locator=//div[@class='inventory_item_name']    expected=Sauce Labs Bike Light
    addtocartresource.click the checkout button in the cart
    Element Text Should Be    ${checkoutone}    Checkout: Your Information

    
Verify the user can cancel the checkoutone process
    [Tags]    cancelincheckoutone
    LoginPageResource.Fill the login form    username=standard_user    password=secret_sauce
    ProductpageResource.Add the Product to the cart
    addtocartresource.click the add to cart button
    Element Text Should Be    locator=//div[@class='inventory_item_name']    expected=Sauce Labs Bike Light
    addtocartresource.click the checkout button in the cart
    addtocartresource.click the cancel button
    Element Text Should Be    locator=//div[@class='inventory_item_name']    expected=Sauce Labs Bike Light

    
    


    
    