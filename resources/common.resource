*** Settings ***
Documentation     Shared settings, test data and browser setup for UI tests.
Library           SeleniumLibrary    timeout=10s    run_on_failure=Capture Page Screenshot


*** Variables ***
${BASE_URL}           https://www.saucedemo.com/
${BROWSER}            chrome
# Window size, and no Chrome "password breach" popup blocking the page after login.
${CHROME_OPTIONS}     add_argument("--window-size=1920,1080");add_experimental_option("prefs", {"credentials_enable_service": False, "profile.password_manager_enabled": False, "profile.password_manager_leak_detection": False})

${STANDARD_USER}      standard_user
${LOCKED_USER}        locked_out_user
${PASSWORD}           secret_sauce

${BACKPACK}           Sauce Labs Backpack
${BIKE_LIGHT}         Sauce Labs Bike Light


*** Keywords ***
Open Store
    Open Browser    ${BASE_URL}    ${BROWSER}    options=${CHROME_OPTIONS}

Open Store And Login
    Open Store
    Login As    ${STANDARD_USER}    ${PASSWORD}

Login As
    [Arguments]    ${username}    ${password}
    Input Text        id:user-name    ${username}
    Input Password    id:password     ${password}
    Click Button      id:login-button
