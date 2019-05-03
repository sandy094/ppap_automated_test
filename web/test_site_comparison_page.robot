*** Settings ***
Force Tags    Login
Suite Setup    SuiteSetup
Suite Teardown    SuiteTeardown
Resource    ../lib/resource.robot
Resource    ../keyword/keyword_common.robot
Resource    ../keyword/keyword_site_comparison.robot

*** Test Cases ***
Check login
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}

Check sidebar link Game Information navigation is correct
    Close Announcement 
    Set Browser Implicit Wait    10s
    Click Sidebar Link    站台比较

Search In Condition
    Sleep  10s
    Wait Until Page Contains Element  //site-filter/div
    Click Element    //site-filter/div
    Wait Until Page Contains Element    //div[@id='unselectTable']/table/tbody/tr[1]
    # 選站台篩選
    Click Element    //div[@id='unselectTable']/table/tbody/tr[1] 
    Click Element    //div[@id='unselectTable']/table/tbody/tr[2]
    Sleep   5s
    Click Element    //div[@class='drop-panel']/select-site/div/div/button
    Wait Until Page Contains Element    //div[@class='fast-Apply']/div[2]
    Click Element    //div[@class='fast-Apply']/div[2]   # 選QA測試條件
    Click Element    //ba-card[@id='settings']//div/button[contains(.,' 开始比较 ')]
    Check Search Condition Is correct

Quick Search Time
    ${checkValueA}  Set Variable    0
    ${checkValueC}  Set Variable    0
    @{days}  Set Variable    上周  本月  上月
    :FOR  ${day}  IN  @{days}
    \    Quick Search botton    ${day}
    # 驗證數值
    \    ${checkValueB}=  Get Text    //table[@id='comparisonArea']/tbody/tr[3]/td[2]
    \    ${result}=  Runkeyword And Return Status    Should Not Match    ${checkValueA}  ${checkValueB}
    \    ${checkValueA}  Set Variable  ${checkValueB}
    \    ${checkValueD}=  Get Text    //table[@id='comparisonArea']/tbody/tr[3]/td[3]
    \    ${result}=  Runkeyword And Return Status    Should Not Match    ${checkValueC}  ${checkValueD}
    \    ${checkValueC}  Set Variable  ${checkValueD}

    @{years}  Set Variable    本年  去年  本季  上季
    :FOR  ${year}  IN  @{years}
    \    Quick Search In year and season    ${year}
    # 驗證數值
    \    ${checkValueB}=  Get Text    //table[@id='comparisonArea']/tbody/tr[3]/td[2]
    \    ${result}=  Runkeyword And Return Status    Should Not Match    ${checkValueA}  ${checkValueB}
    \    ${checkValueA}  Set Variable  ${checkValueB}
    \    ${checkValueD}=  Get Text    //table[@id='comparisonArea']/tbody/tr[3]/td[3]
    \    ${result}=  Runkeyword And Return Status    Should Not Match    ${checkValueC}  ${checkValueD}
    \    ${checkValueC}  Set Variable  ${checkValueD}

    @{months}  Set Variable    0: 2019年5月  1: 2019年4月   
    :FOR  ${month}  IN  @{months}
    \    Search In Month    ${month}
    # 驗證數值
    \    ${checkValueB}=  Get Text    //table[@id='comparisonArea']/tbody/tr[3]/td[2]
    \    ${result}=  Runkeyword And Return Status    Should Not Match    ${checkValueA}  ${checkValueB}
    \    ${checkValueA}  Set Variable  ${checkValueB}
    \    ${checkValueD}=  Get Text    //table[@id='comparisonArea']/tbody/tr[3]/td[3]
    \    ${result}=  Runkeyword And Return Status    Should Not Match    ${checkValueC}  ${checkValueD}
    \    ${checkValueC}  Set Variable  ${checkValueD}

Search Another Condition
    # 改變搜尋條件
    Execute JavaScript  window.document.documentElement.scrollTop = 0;
    Wait Until Page Contains Element    //div[@class='sitecomparison-table-out']/div/button
    Click Element    //div[@class='sitecomparison-table-out']/div/button
    Sleep    2s
    Click Element    //div[@id='settingSection']/div/span[contains(.,'存提差 (总额)')]
    Sleep    2s
    Click Element    //div[@id='settingSection']/div/div/span[contains(.,'线上存款-金额')]
    Sleep    2s
    Click Element    //ba-card[@id='settings']//div/button[contains(.,' 开始比较 ')]
    
    Sleep    5s
    Page Should Not Contain Element    //table[@id='comparisonArea']/tbody/tr/td[1][contains(.,' 线上存款-金额 ')]
    Page Should Contain Element    //table[@id='comparisonArea']/tbody/tr/td[1][contains(.,' 存提差 ')]
    Execute JavaScript  window.document.documentElement.scrollTop = 720;
    Wait Until Page Contains Element  //div[@id='category']/div/div/div[@ngbtooltip='趋势详细']
    Click Element    //div[@id='category']/div/div/div[@ngbtooltip='趋势详细']
    Page Should Contain Element    //div[@id='categoryChart']/echarts-ng2/div/div/canvas
    Mouse Over  //div[@id='categoryChart']/echarts-ng2/div/div/canvas
    Capture Page Screenshot 
    # 排序圖表 
    Wait Until Page Contains Element  //table[@id='comparisonArea']/tbody/tr[30]/td[1]/span/i
    Click Element   //table[@id='comparisonArea']/tbody/tr[30]/td[1]/span/i
    Sleep  2s
    Page Should Contain Element    //div[@id='categoryChart']/echarts-ng2/div/div/canvas
    Mouse Over  //div[@id='categoryChart']/echarts-ng2/div/div/canvas
    Capture Page Screenshot

    Wait Until Page Contains Element  //div[@id='gamehall']/div/div/div[@ngbtooltip='趋势详细']
    Click Element    //div[@id='gamehall']/div/div/div[@ngbtooltip='趋势详细']
    Page Should Contain Element    //div[@id='hallChart']/echarts-ng2/div/div/canvas
    Mouse Over  //div[@id='hallChart']/echarts-ng2/div/div/canvas
    Capture Page Screenshot  
    # 排序圖表 
    Wait Until Page Contains Element  //table[@id='comparisonArea']/tbody/tr[40]/td[1]/span/i
    Click Element   //table[@id='comparisonArea']/tbody/tr[40]/td[1]/span/i
    Sleep  2s
    Page Should Contain Element    //div[@id='hallChart']/echarts-ng2/div/div/canvas
    Mouse Over  //div[@id='hallChart']/echarts-ng2/div/div/canvas
    Capture Page Screenshot


*** Keywords ***
SuiteSetup
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    Set Browser Implicit Wait    10s
    
SuiteTeardown
    Run Keyword If Any Tests Failed    Capture Page Screenshot    
    Close Browser
