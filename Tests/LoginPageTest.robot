*** Settings ***
Documentation    Tests to Login to Login Page
Library    SeleniumLibrary
Test Setup    Open the browser with URL
Test Teardown    Close browser session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginPageResource.robot
Library    DataDriver    file=C:/Users/Lenovo/Desktop/SauceDemo-Project/Resources/LoginDataSauce.xlsx    sheet_name=Sheet1
Test Template    Validate Login in sauce demo

*** Variables ***
${username}
${password}

*** Test Cases ***
Validate Login with    ${username}    ${password}

*** Keywords ***
Validate Login in sauce demo
    [Arguments]    ${username}    ${password} 
    LoginPageResource.Fill the login form    ${username}    ${password}
    
    IF    '${username}' == 'standard_user' or '${username}'=='performance_glitch_user' or '${username}'=='error_user' or '${username}'=='visual_user' or '${username}'=='problem_user'
        LoginPageResource.Verify the user is successfully logged in
    ELSE IF    '${username}' == 'locked_out_user'
        LoginPageResource.Verify the user get the error message by locked
    ELSE IF    '${password}' == 'secret'
        LoginPageResource.Verify the user get error message by empty username
    ELSE IF    '${username}' == 'abc'
        LoginPageResource.Verify the user get error message by empty password
    ELSE IF    '${username}' == ''
        LoginPageResource.Verify the user get error message by empty username
    END