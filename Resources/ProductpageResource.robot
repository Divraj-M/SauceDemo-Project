*** Settings ***
Documentation    resources for Product page
Library    SeleniumLibrary

*** Variables ***
${menu-bar}    id:react-burger-menu-btn
${Allitem}    id:inventory_sidebar_link
${about}    id:about_sidebar_link
${logout}    id:logout_sidebar_link
${resetapp}    id:reset_sidebar_link
${productdog}    xpath://div[contains(text(),'Sauce Labs Bike Light')]
${addtocart}    xpath://button[@class='btn btn_primary btn_small btn_inventory']
${Productprice}    xpath://div[@class='inventory_item_price']
${filter3}    xpath://select[@class='product_sort_container']//option[3]
${text2}

*** Keywords ***
Click the Menu button in the product page
    Click Element    ${menu-bar}

Click the All items in the product page
    Click Element    ${Allitem}

Click the about page
    Click Element    ${about}

Click the logout button in the product page
    Click Element    ${logout}

Click the resetapp button in the product page
    Click Element    ${resetapp}

Add the Product to the cart
    Click Element  ${productdog}
    Click Button    ${addtocart}

Apply the filter low to high
    Click Element    ${filter3}

Store the list of price in the variable list before apply filter
    ${list}    Get WebElements    ${Productprice}

    FOR    ${price}    IN    @{list}
        ${text2}=    Get Text    ${price}
    END    
    Log To Console    ${text2}
    

Store the list of price in the variable list after apply filter
    ${list}    Get WebElements    ${Productprice}
    @{texts}=       Create List
    FOR    ${price}    IN    @{list}
        ${texts}=    Get Text    ${price}
    END
    Log To Console    ${texts}
    Should Contain   ${text2}    ${texts}
    



