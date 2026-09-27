*** Settings ***
Documentation     API session setup for JSONPlaceholder (free public test API).
Library           RequestsLibrary
Library           Collections


*** Variables ***
${API_URL}    https://jsonplaceholder.typicode.com


*** Keywords ***
Create API Session
    Create Session    api    ${API_URL}    verify=True
