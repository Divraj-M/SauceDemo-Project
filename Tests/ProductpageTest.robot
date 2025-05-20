*** Settings ***
Library    SeleniumLibrary
Documentation    Product page tests
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginPageResource.robot
Resource    ../Resources/ProductpageResource.robot
Test Setup    Open the Browser with URL
Test Teardown    Close browser session


*** Test Cases ***
Validate the all item buttons in the menu
    [Tags]    alliteminmenu
    LoginPageResource.Fill the login form    username=standard_user    password=secret_sauce
    ProductpageResource.Click the Menu button in the product page
    ProductpageResource.Click the All items in the product page
    Element Text Should Be    ${Allitem}    All Items

verify the about page
    [Tags]    aboutpage
    LoginPageResource.Fill the login form    username=standard_user    password=secret_sauce
    ProductpageResource.Click the Menu button in the product page
    ProductpageResource.Click the about page
    Element Text Should Be    locator=//h1[@class='MuiTypography-root MuiTypography-h1 css-152qxt']    expected=Build apps users love with AI-driven insights

verify the Logout button in the product page
    [Tags]    logout
    LoginPageResource.Fill the login form    username=standard_user    password=secret_sauce
    ProductpageResource.Click the Menu button in the product page
    ProductpageResource.Click the logout button in the product page
    Element Should Be Visible    id:login-button   

verify the resetapp in the page
    [Tags]    resetapp
    LoginPageResource.Fill the login form    username=standard_user    password=secret_sauce
    ProductpageResource.Add the Product to the cart
    ProductpageResource.Click the Menu button in the product page
    ProductpageResource.Click the resetapp button in the product page
    # Sleep    5s
    Element Should Not Be Visible    xpath://span[@class='shopping_cart_badge']

# Verify the filter as low to high
#     [Tags]    lowtohigh
#     LoginPageResource.Fill the login form    username=standard_user    password=secret_sauce
#     ProductpageResource.Store the list of price in the variable list before apply filter
#     ProductpageResource.Apply the filter low to high
#     ProductpageResource.Store the list of price in the variable list after apply filter