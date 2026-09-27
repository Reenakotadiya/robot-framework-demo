*** Settings ***
Documentation     Cart tests: add, remove and review products.
Resource          ../../resources/products_page.resource
Resource          ../../resources/checkout_page.resource
Test Setup        Open Store And Login
Test Teardown     Close Browser


*** Test Cases ***
Adding A Product Updates Cart Badge
    [Tags]    smoke
    Add Product To Cart    ${BACKPACK}
    Cart Badge Should Show    1

Removing A Product Clears Cart Badge
    [Tags]    regression
    Add Product To Cart    ${BACKPACK}
    Remove Product From Cart    ${BACKPACK}
    Cart Badge Should Be Hidden

Cart Lists All Added Products
    [Tags]    regression
    Add Product To Cart    ${BACKPACK}
    Add Product To Cart    ${BIKE_LIGHT}
    Open Cart
    Cart Should Contain Exactly    ${BACKPACK}    ${BIKE_LIGHT}
