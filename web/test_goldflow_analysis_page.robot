*** Settings ***
Force Tags    Login
Suite Setup    SuiteSetup
Suite Teardown    SuiteTeardown
Resource    ../lib/resource.robot
Resource    ../keyword/keyword_common.robot
Resource    ../keyword/keyword_goldflow_analysis.robot

*** Test Cases ***
Check login
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}

Check sidebar link Game Information navigation is correct
    Close Announcement 
    Click Sidebar Link    站台概况
    Click Sidebar Link    金流解析

Click Quick Search
    Sleep    10s
    # ${valueB}    Set Variable    0
    @{days}  Set Variable    上周  本月  上月 
    :FOR  ${day}  IN  @{days}
    \  Quick Search botton    ${day}
    \  Sleep    5s
    \  Check Values
    \  Check Detial For Each Day
    # \  Click Element    //div[@id='arbitrage_anal_rank']//div/a[@class='nor_tabs mt-0']
    # \  Check Values
    \  Capture Page Screenshot

*** Keywords ***
SuiteSetup
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    Set Browser Implicit Wait    10s
    
SuiteTeardown
    Run Keyword If Any Tests Failed    Capture Page Screenshot    
    Close Browser
