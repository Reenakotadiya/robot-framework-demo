*** Settings ***
Documentation     Products page locators and keywords.
Resource          common.resource


*** Variables ***
${PAGE_TITLE}        css:.title
${INVENTORY_ITEM}    css:.inventory_item
${CART_BADGE}        css:.shopping_cart_badge
${CART_LINK}         css:.shopping_cart_link


*** Keywords ***
Products Page Should Be Open
    Wait Until Element Contains    ${PAGE_TITLE}    Products
    ${count}=    Get Element Count    ${INVENTORY_ITEM}
    Should Be True    ${count} > 0    msg=No products are shown

Add Product To Cart
    [Arguments]    ${product}
    ${slug}=    Product Slug    ${product}
    Click Element    css:[data-test="add-to-cart-${slug}"]

Remove Product From Cart
    [Arguments]    ${product}
    ${slug}=    Product Slug    ${product}
    Click Element    css:[data-test="remove-${slug}"]

Cart Badge Should Show
    [Arguments]    ${expected}
    Element Text Should Be    ${CART_BADGE}    ${expected}

Cart Badge Should Be Hidden
    Page Should Not Contain Element    ${CART_BADGE}

Open Cart
    Click Element    ${CART_LINK}

Product Slug
    [Documentation]    "Sauce Labs Backpack" -> "sauce-labs-backpack", as used in data-test ids.
    [Arguments]    ${product}
    ${slug}=    Evaluate    $product.lower().replace(" ", "-")
    RETURN    ${slug}
