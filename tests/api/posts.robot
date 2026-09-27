*** Settings ***
Documentation     REST API tests for the /posts endpoint: GET, POST, PUT, DELETE and 404.
Resource          ../../resources/api.resource
Suite Setup       Create API Session
Test Tags         api


*** Test Cases ***
Get Single Post Returns Correct Data
    [Tags]    smoke
    ${response}=    GET On Session    api    /posts/1    expected_status=200
    ${post}=    Set Variable    ${response.json()}
    Should Be Equal As Integers    ${post}[id]    1
    Dictionary Should Contain Key    ${post}    title
    Dictionary Should Contain Key    ${post}    body

Get All Posts Returns List Of 100
    [Tags]    regression
    ${response}=    GET On Session    api    /posts    expected_status=200
    Length Should Be    ${response.json()}    100

Create Post Returns 201 And New Id
    [Tags]    smoke
    ${body}=    Create Dictionary    title=QA Automation    body=Testing APIs with Robot Framework    userId=${1}
    ${response}=    POST On Session    api    /posts    json=${body}    expected_status=201
    ${post}=    Set Variable    ${response.json()}
    Should Be Equal    ${post}[title]    QA Automation
    Dictionary Should Contain Key    ${post}    id

Update Post Returns Updated Data
    [Tags]    regression
    ${body}=    Create Dictionary    id=${1}    title=Updated title    body=Updated body    userId=${1}
    ${response}=    PUT On Session    api    /posts/1    json=${body}    expected_status=200
    Should Be Equal    ${response.json()}[title]    Updated title

Delete Post Returns 200
    [Tags]    regression
    DELETE On Session    api    /posts/1    expected_status=200

Missing Post Returns 404
    [Tags]    regression
    GET On Session    api    /posts/99999    expected_status=404
