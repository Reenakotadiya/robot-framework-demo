*** Settings ***
Documentation     Login page locators and keywords.
Resource          common.resource


*** Variables ***
${ERROR_MESSAGE}    css:[data-test="error"]


*** Keywords ***
Login Error Should Contain
    [Arguments]    ${expected}
    Element Should Contain    ${ERROR_MESSAGE}    ${expected}
