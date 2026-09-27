*** Settings ***
Documentation     Checkout tests: full order flow and form validation.
Resource          ../../resources/products_page.resource
Resource          ../../resources/checkout_page.resource
Test Setup        Open Store And Go To Checkout
Test Teardown     Close Browser


*** Test Cases ***
Complete Order End To End
    [Tags]    smoke
    Enter Customer Details    Reena    Tester    380001
    Finish Order
    Order Should Be Complete

Checkout Requires First Name
    [Tags]    regression
    Enter Customer Details    ${EMPTY}    Tester    380001
    Checkout Error Should Contain    First Name is required


*** Keywords ***
Open Store And Go To Checkout
    Open Store And Login
    Add Product To Cart    ${BACKPACK}
    Open Cart
    Start Checkout
