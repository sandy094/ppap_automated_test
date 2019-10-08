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

Click Quick Search
    Sleep    10s
    ${valueB}    Set Variable    0
    @{days}  Set Variable    上周  本月  上月 
    :FOR  ${day}  IN  @{days}
    \  Quick Search botton    ${day}
    \  Sleep    10s
    \  Check Values
    \  Check Trend
    \  Click Element    //div[@id='arbitrage_anal_rank']//div/a[@class='nor_tabs mt-0']
    \  Check Values

Check Arbutrage Detial By Site 
    Quick Search botton    本月   
    Wait Until Page Contains Element    //table[@class="arbitrage_anal__Table table-striped"]/tbody/tr[2]/td[2]/span
    Click Element    //table[@class="arbitrage_anal__Table table-striped"]/tbody/tr[2]/td[2]/span
    Check Detial value
    Capture Page Screenshot
    Site Detial Short

Check Arbutrage Detial By Game 
    Click Element    //*[@id="site-detail"]/div[1]/h3/i 
    Wait Until Page Contains Element    //div[@id="arbitrage_anal_rank"]/div/div/a[contains(.,' 遊戲套利排行 ')]
    Click Element    //div[@id="arbitrage_anal_rank"]/div/div/a[contains(.,' 遊戲套利排行 ')]
    Wait Until Page Contains Element    //table[@class="arbitrage_anal__Table table-striped"]/tbody/tr[2]/td[2]/span
    Click Element    //table[@class="arbitrage_anal__Table table-striped"]/tbody/tr[2]/td[2]/span
    Check Detial value
    Capture Page Screenshot
    Game Detial Short

Ckeck Trend Picture
    Reload Page
    Sleep    10s
    Quick Search botton    本月 
    :FOR  ${num}  IN  6  8  10
    \  Wait Until Page Contains Element    //div[@id='arbitrage_anal_rank']//table/tbody/tr[2]/td[${num}]/span
    \  Click Element    //div[@id='arbitrage_anal_rank']//table/tbody/tr[2]/td[${num}]/span
    \  Sleep    5s
    \  Wait Until Page Contains Element    //*[@id="growth"]/echarts-ng2/div/div[1]/canvas
    \  Mouse Over    //*[@id="growth"]/echarts-ng2/div/div[1]/canvas
    \  Capture Page Screenshot
    \  Click Element    //div[@class='modal-dialog modal-lg']//div[@class="close_btn"]/i


*** Keywords ***
SuiteSetup
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    Set Browser Implicit Wait    10s
    
SuiteTeardown
    Run Keyword If Any Tests Failed    Capture Page Screenshot    
    Close Browser
