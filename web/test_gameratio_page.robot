*** Settings ***
Force Tags    Login
Suite Setup    SuiteSetup
Suite Teardown    SuiteTeardown
Resource    ../lib/resource.robot
Resource    ../keyword/keyword_common.robot
Resource    ../keyword/keyword_gameratio.robot

*** Test Cases ***
Check login
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}

Check sidebar link Game Information navigation is correct
    # 關掉公告訊息提示
    # Wait Until Page Contains Element    //div[@class='container bg-white boss-know-panel']//button[1]
    Click Element  //div[@class='container bg-white boss-know-panel']//button[1]
    Click Sidebar Link    运营看板
    Set Browser Implicit Wait    10s
    Check Game Information Link    游戏占比

Click Quick Search
    Sleep    10s
    @{days}  Set Variable  上月  昨日  本周  上周  本月  
    :FOR  ${day}  IN  @{days}
    \  Sleep  5s
    \  Quick Search botton    ${day}
    \  Check Values
   
    @{seasons}  Set Variable  本年  去年  本季  上季
    :FOR  ${season}  IN  @{seasons}
    \  Sleep  5s
    \  Quick Search In year and season    ${season}
    \  Check Values

Search In Datetime 
    Sleep  5s
    @{mounths}    Set Variable    0: 2018年9月  1: 2018年8月  2: 2018年7月  3: 2018年6月  4: 2018年5月  5: 2018年4月  6: 2018年3月  7: 2018年2月  8: 2018年1月  9: 2017年12月  10: 2017年11月  11: 2017年10月  12: 2017年9月
    :FOR    ${month}  IN  @{mounths}
    \  Search In Month    ${month}
    \  Check Values

    Reload Page

Search In Category
    Set Browser Implicit Wait    10s
    @{classes}  Set Variable    CATEGORY-.1  CATEGORY-.2  CATEGORY-.3  CATEGORY-.4  CATEGORY-.5
    :FOR    ${class}  IN  @{classes}
    \  Set Browser Implicit Wait    10s
    \  Wait Until Page Contains Element  //li[contains(.,'种类查询')]
    \  Click Element  //li[contains(.,'种类查询')]
    \  Wait Until Page Contains Element    //label[@for='${class}']
    \  Click Element  //label[@for='${class}']
    \  Sleep  7s
    \  Check Values
    \  Short
    \  Capture Page Screenshot
    \  Click Element  //li[contains(.,'站台排名')]
    \  Sleep  3s
    \  Wait Until Page Contains Element  //div[@class='CHART-AREA']/echarts-ng2/div/div/canvas
    \  Capture Page Screenshot
    \  Reload Page

Search In Classification
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot
    Set Browser Implicit Wait    10s
    Wait Until Page Contains Element  //li[contains(.,'类型查询')]
    Click Element  //li[contains(.,'类型查询')]
    Click Element  //label[@for='GAMEHALL-.0']
    @{stations}  Set Variable    GAMEHALL-.0.0    GAMEHALL-.0.1    GAMEHALL-.0.2    GAMEHALL-.0.3    GAMEHALL-.0.4
    :FOR    ${station}  IN  @{stations}
    \  Set Browser Implicit Wait    10s
    \  Wait Until Page Contains Element    //label[@for='${station}']
    \  Click Element  //label[@for='${station}']
    \  Sleep  7s
    \  Check Values
    \  Short
    \  Capture Page Screenshot
    \  Click Element  //li[contains(.,'站台排名')]
    \  Sleep  5s
    \  Wait Until Page Contains Element  //div[@class='CHART-AREA']/echarts-ng2/div/div/canvas
    \  Capture Page Screenshot
    \  Reload Page
    
 
Search In Game Name
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot
    Set Browser Implicit Wait    10s
    Wait Until Page Contains Element  //li[contains(.,'游戏查询')]
    Click Element    //li[contains(.,'游戏查询')]
    Input Text  //input[@class='form-control']    888gpk
    Wait Until Page Contains Element  //button[@id='ngb-typeahead-0-0']
    Click Element  //button[@id='ngb-typeahead-0-0']
    Wait Until Page Contains Element  //div[@class='show_pick_left']
    ${A}=  Get Text  //div[@class='show_pick_left']/div[1]
    Click Element  //div[@class='show_pick_left']
    Sleep    10s
    Wait Until Page Contains Element  //div[@class='inner']//table/tbody/tr[1]/td[1]  
    ${B}=  Get Text  //div[@class='inner']//table/tbody/tr[1]/td[1]
    Should Match  ${A}  ${B}
    Click Element  //li[contains(.,'站台排名')]
    Wait Until Page Contains Element  //div[@class='CHART-AREA']/echarts-ng2/div/div/canvas

    Reload Page

Modularization
    Set Browser Implicit Wait    10s
    Click Element  //div[@class='button-list']/button[contains(.,'栏位全开')]
    Page Should Contain Element  //div[@class='DETAIL-TABLE']//thead/tr/th[7]
    Page Should Contain Element  //div[@class='DETAIL-TABLE']//thead/tr/th[8]
    Page Should Contain Element  //div[@class='DETAIL-TABLE']//thead/tr/th[9]
    
    @{cols}  Set Variable  7  8  9 
    :FOR  ${col}  IN  @{cols}
    \  Wait Until Page Contains Element  //div[@class='inner']//table/tbody/tr[1]/td[${col}]
    \  ${value}=  Get Text  //div[@class='inner']//table/tbody/tr[1]/td[${col}]
    \  Should Not Be Empty  ${value}

    @{fields}  Set Variable  流失率  留存率  黏着度
    :FOR  ${field}  IN  @{fields}
    \  Click Element  //div[@class='button-list']/button[contains(.,'回到预设')] 
    \  Click Element  //div[@class='button-list']/button[contains(.,'${field}')]
    \  ${CheckValueA}=  Get Text  //div[@class='button-list']/button[contains(.,'${field}')]
    \  ${CheckValueB}=  Get Text  //div[@class='DETAIL-TABLE']//thead/tr/th[7]//a
    \  Should Match    ${CheckValueA}    ${CheckValueB}


Check four cards 
    # 娛樂城分布與詳細
    Sleep  3s
    Wait Until Page Contains Element  //ba-card[@id='pie']/div/div/h3
    Click Element  //ba-card[@id='pie']/div/div/h3
    Execute JavaScript    window.scrollTo(200, document.body.scrollHeight)
    Page Should Contain Element  //ba-card[@id='pie']/div/div/pie-panel/div/div/echarts-ng2/div
    Sleep    5s
    Capture Page Screenshot
    
    # 站台排名
    Wait Until Page Contains Element  //ba-card[@id='pieRank']/div/div/h3
    Click Element  //ba-card[@id='pieRank']/div/div/h3
    Page Should Contain Element  //ba-card[@id='pieRank']/div/div/website-rank-chart
    Sleep    5s
    Capture Page Screenshot

    Click Element  //div[@id='piepanelchart']/dropdown-selector
    Click Element  //div[@id='piepanelchart']/dropdown-selector//li[contains(.,'有效投注')]
    Sleep    7s
    Capture Page Screenshot

    Click Element  //div[@id='rank4']/dropdown-selector
    Click Element  //div[@id='rank4']/dropdown-selector//li[contains(.,'投注单量')]
    Sleep    5s
    Capture Page Screenshot

    # 娛樂城趨勢與占台排名
    Wait Until Page Contains Element  //ba-card[@id='trend']/div/div/h3
    Click Element    //ba-card[@id='trend']/div/div/h3
    Page Should Contain Element  //div[@id='trendchart']
    Sleep    5s
    Capture Page Screenshot

    Execute JavaScript    window.scrollTo(200, document.body.scrollHeight)
    # 站台排名
    Wait Until Page Contains Element  //ba-card[@id='trendRank']/div/div/h3
    Click Element  //ba-card[@id='trendRank']/div/div/h3
    Page Should Contain Element  //ba-card[@id='trendRank']/div/div/website-rank-chart
    Sleep    5s
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
