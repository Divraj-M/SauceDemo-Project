*** Settings ***
Documentation    add to cart page resources
Library    SeleniumLibrary

*** Variables ***
${addtocartbtn}    xpath://a[@class='shopping_cart_link']
${removebtn}    xpath://button[@class='btn btn_secondary btn_small cart_button']
${continueshopping}    id:continue-shopping
${checkout}    id:checkout
${checkoutone}    xpath://span[contains(text(),'Checkout: Your Information')]
${cancel}    id:cancel


*** Keywords ***
click the add to cart button
    Click Element    ${addtocartbtn}

click the remove button in the cart
    Click Element    ${removebtn}

click the continue shopping button
    Click Button    ${continueshopping}

click the checkout button in the cart
    Click Button    ${checkout}

click the cancel button
    Click Element    ${cancel}

