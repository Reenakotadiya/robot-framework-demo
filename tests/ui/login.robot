*** Settings ***
Documentation     Login tests: valid login plus data-driven negative cases.
Resource          ../../resources/login_page.resource
Resource          ../../resources/products_page.resource
Test Setup        Open Store
Test Teardown     Close Browser


*** Test Cases ***
Valid Login Opens Products Page
    [Tags]    smoke
    Login As    ${STANDARD_USER}    ${PASSWORD}
    Products Page Should Be Open

Invalid Login Shows Correct Error
    [Tags]    regression
    [Template]    Login Should Fail With Error
    # USERNAME          PASSWORD          EXPECTED ERROR
    ${LOCKED_USER}      ${PASSWORD}       Sorry, this user has been locked out
    ${STANDARD_USER}    wrong_password    Username and password do not match
    ${EMPTY}            ${PASSWORD}       Username is required
    ${STANDARD_USER}    ${EMPTY}          Password is required


*** Keywords ***
Login Should Fail With Error
    [Arguments]    ${username}    ${password}    ${expected_error}
    Reload Page
    Login As    ${username}    ${password}
    Login Error Should Contain    ${expected_error}
