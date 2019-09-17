*** Settings ***
Force Tags    Login
Suite Setup    SuiteSetup
Suite Teardown    SuiteTeardown
Resource    ../lib/resource.robot
Resource    ../keyword/keyword_common.robot
Resource    ../keyword/keyword_arbutrage_analysis.robot

*** Test Cases ***
Check login
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}

Check sidebar link Game Information navigation is correct
    Close Announcement 
    Click Sidebar Link    风控回报
    Click Sidebar Link    套利解析

Click Qick Search
    Sleep    10s
    ${valueB}    Set Variable    0
    @{days}  Set Variable    上周  本月  上月 
    :FOR  ${day}  IN  @{days}
    \  Quick Search botton    ${day}
    \  Sleep    10s
    \  Capture Page Screenshot
    \  Check Values
    # \  ${valueA}=  Get Text    //div[@id="tableData"] //tbody/tr[2]/td[@class='totalClickCounts-td']   #點擊數
    # \  ${result}=  Run Keyword And Return Status   Should Not Match    ${valueA}  ${valueB}
    # \  Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    # \  ${valueB}  Set Variable    ${valueA}
   

*** Keywords ***
SuiteSetup
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    Set Browser Implicit Wait    10s
    
SuiteTeardown
    Run Keyword If Any Tests Failed    Capture Page Screenshot    
    Close Browser
