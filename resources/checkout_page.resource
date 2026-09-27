*** Settings ***
Documentation     Cart and checkout page locators and keywords.
Resource          common.resource


*** Variables ***
${CART_ITEM_NAME}     css:.cart_item .inventory_item_name
${CHECKOUT_BUTTON}    id:checkout
${CHECKOUT_ERROR}     css:[data-test="error"]
${COMPLETE_HEADER}    css:.complete-header


*** Keywords ***
Cart Should Contain Exactly
    [Arguments]    @{expected_products}
    Wait Until Element Is Visible    ${CHECKOUT_BUTTON}
    ${elements}=    Get WebElements    ${CART_ITEM_NAME}
    ${names}=    Evaluate    [element.text for element in $elements]
    Should Be Equal    ${names}    ${expected_products}

Start Checkout
    Click Button    ${CHECKOUT_BUTTON}

Enter Customer Details
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Input Text    id:first-name     ${first_name}
    Input Text    id:last-name      ${last_name}
    Input Text    id:postal-code    ${postal_code}
    Click Button    id:continue

Finish Order
    Click Button    id:finish

Order Should Be Complete
    Element Text Should Be    ${COMPLETE_HEADER}    Thank you for your order!

Checkout Error Should Contain
    [Arguments]    ${expected}
    Element Should Contain    ${CHECKOUT_ERROR}    ${expected}
