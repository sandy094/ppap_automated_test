*** Settings ***
Force Tags    Login
Suite Setup    SuiteSetup
Suite Teardown    SuiteTeardown
Resource    ../lib/resource.robot
Resource    ../keyword/keyword_common.robot
Resource    ../keyword/keyword_sitelist.robot

*** Test Cases ***
Check login
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    
Check sidebar link Operational navigation is correct
    # 關掉公告訊息提示
    # Wait Until Page Contains Element    //div[@class='container bg-white boss-know-panel']//button[1]
    # Click Element  //div[@class='container bg-white boss-know-panel']//button[1]
    Sleep    10s
    Click Sidebar Link    运营看板
    Check Operational Information Link    站台列表

# driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
Click Search
    # Click Element  //div[@class='loader-panel load-xs-go p-2']/i
    Set Browser Implicit Wait    20s
    ${CheckValueA}  Set Variable  0
    @{days}  Set Variable  今日  昨日  本周  上周  本月  上月
    :FOR  ${day}  IN  @{days}
    \  Quick Search botton    ${day}
    # 判斷是否有更新頁面
    \  ${CheckValueB}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    \  Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  Check Values

    ${CheckValueA}  Set Variable  0
    @{years}  Set Variable  本年  去年  本季  上季
    :FOR  ${year}  IN  @{years}
    \  Quick Search In year and season    ${year}
    # 判斷是否有更新頁面
    \  ${CheckValueB}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    \  Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  Check Values
Check Trend 
    # 趨勢
    @{trs}  Set Variable  1  2  3  4  5  6  7  8  9  10
    :FOR  ${tr}  IN  @{trs}
    \  trend  ${tr}

Short
    Set Browser Implicit Wait    10s
    @{number}  Set variable  3  4  5  6  7 
    :FOR  ${num}  IN  @{number}
    \  Set Browser Implicit Wait    10s
    \  Wait Until Page Contains Element  //div[@id="data-table"]//table/thead/tr[1]/th[${num}]//a
    \  Click Element  //div[@id="data-table"]//table/thead/tr[1]/th[${num}]//a
    # 升冪
    \  ${ValueA}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[${num}]
    \  ${ValueB}=  Get Text  //div[@id="data-table"]//table/tbody/tr[2]/td[${num}]
    \  ${ValueA}=    Remove String    ${ValueA}    ,
    \  ${ValueB}=    Remove String    ${ValueB}    ,
    \  Convert To Integer    ${ValueA}
    \  Convert To Integer    ${ValueB}
    \  Should Be True  ${ValueA}<=${ValueB}

    # 降冪
    \  Click Element  //div[@id="data-table"]//table/thead/tr[1]/th[${num}]//a
    \  ${ValueC}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[${num}]
    \  ${ValueD}=  Get Text  //div[@id="data-table"]//table/tbody/tr[2]/td[${num}]
    \  ${ValueC}=    Remove String    ${ValueC}    ,
    \  ${ValueD}=    Remove String    ${ValueD}    ,
    \  Convert To Integer    ${ValueC}
    \  Convert To Integer    ${ValueD}
    \  Should Be True  ${ValueC}>=${ValueD}

Search In Datetime 
    Set Browser Implicit Wait    10s
    ${CheckValueA}  Set Variable  0
    @{mounths}    Set Variable    0: 2018年8月  1: 2018年7月  2: 2018年6月  3: 2018年5月  4: 2018年4月  5: 2018年3月  6: 2018年2月  7: 2018年1月  8: 2017年12月  9: 2017年11月  10: 2017年10月  11: 2017年9月  12: 2017年8月
    :FOR    ${month}  IN  @{mounths}
    \  Search In Month    ${month}
    # 判斷是否有更新頁面
    \  ${CheckValueB}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    \  Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  Check Values

    Reload Page
Search In Game Classification
    
    @{labels}    Set Variable    体育-1  视讯-2  机率-3  彩票-4  棋牌-44
    :FOR    ${label}  IN  @{labels}
    \    Sleep    10s
    \    ${CheckValueA}=    Get Text    //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    \    Wait Until Page Contains Element  //label[@for='${label}']  
    \    Click Element  //label[@for='${label}']
    \    Sleep    5s
    \    Wait Until Page Contains Element  //tab[@id="category"]//button[contains(.,'套用')]
    \    Click Element  //tab[@id="category"]//button[contains(.,'套用')]
    \    Sleep  5s
     # 判斷是否有更新頁面
    \    ${CheckValueB}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    \    Should Not Match  ${CheckValueA}  ${CheckValueB}
    \    Check Values
    \    Search In Group
    \    Reload Page
    
    Wait Until Page Contains Element  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    ${CheckValueA}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    # 單選細項
    Click Element  //label[@for='p视讯-2']
    Click Element  //input[@id='视讯-BBIN-1']
    Click Element  //input[@id='视讯-AG-6']
    Click Element  //tab[@id="category"]//button[contains(.,'套用')]
    Sleep    5s
    # 判斷是否有更新頁面
    ${CheckValueB}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    Should Not Match  ${CheckValueA}  ${CheckValueB}
    Capture Page Screenshot
    
    # 檢查趨勢圖是否顯示正常
    trend  2

Search In Game Hall
    # 查BBIN
    ${CheckValueA}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    Click Element  //li[contains(.,'类型')] 

    Click Element  //label[@for='BBIN-1']
    Click Element  //tab[@id="gamehall"]//button[contains(.,'套用')]
    Sleep    5s
    # 判斷是否有更新頁面
    ${CheckValueB}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    Should Not Match  ${CheckValueA}  ${CheckValueB}
    Capture Page Screenshot

    # 查BBIN-彩票
    ${CheckValueA}=    Set Variable    ${CheckValueB}
    Click Element  //input[@id='BBIN-彩票-4']
    Click Element  //tab[@id="gamehall"]//button[contains(.,'套用')]
    Sleep    5s
    # 判斷是否有更新頁面
    ${CheckValueB}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    Should Not Match  ${CheckValueA}  ${CheckValueB}
    Capture Page Screenshot
    trend  2

    # 查看AG视讯
    Wait Until Page Contains Element  //tab[@id="gamehall"]//button[contains(.,'清除/全选')]
    Click Element  //tab[@id="gamehall"]//button[contains(.,'清除/全选')]
    Wait Until Page Contains Element  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    ${CheckValueA}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    Click Element  //label[@for='pAG-6']
    Click Element  //input[@id='AG-视讯-16']
    Click Element  //tab[@id="gamehall"]//button[contains(.,'套用')]
    Sleep    5s
    # 判斷是否有更新頁面
    ${CheckValueB}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    Should Not Match  ${CheckValueA}  ${CheckValueB}
    Click Element  //a[@class='nor_tabs mt-0'][contains(.,'分群')]
    Capture Page Screenshot
    

Search In Game Name
    Reload Page
    Sleep  2s
    Wait Until Page Contains Element  //li[contains(.,'游戏查询')]
    Click Element    //li[contains(.,'游戏查询')]
    Input Text  //input[@class='form-control']    888gpk
    Wait Until Page Contains Element  //button[@id='ngb-typeahead-0-0']
    Click Element  //button[@id='ngb-typeahead-0-0']
    Wait Until Page Contains Element  //div[@class='show_pick_left']
    Click Element  //div[@class='show_pick_left']
    Set Browser Implicit Wait    10s
    Wait Until Page Contains Element  //div[@class='inner']//table/tbody/tr[1]/td[1]  
    ${B}=  Get Text  //div[@class='inner']//table/tbody/tr[1]/td[1]
    Should Not Be Empty  ${B}
    Capture Page Screenshot

Search In Keywords
    Wait Until Page Contains Element  //input[@class='form-control with-primary-addon']
    Click Element  //input[@class='form-control with-primary-addon']
    Input Text  //input[@class='form-control with-primary-addon']    alpha
    Set Browser Implicit Wait    5s
    ${B}=    Get Text    //div[@id="data-table"]//tbody/tr[1]/td[2]//span[1]
    Should Match    ${B}  Alpha*
    Capture Page Screenshot

    Clear Element Text  //input[@class='form-control with-primary-addon']
Check In Group
    Wait Until Page Contains Element  //a[@class='nor_tabs mt-0'][contains(.,'分群')]
    Click Element  //a[@class='nor_tabs mt-0'][contains(.,'分群')]
    Sleep    10s
    Wait Until Page Contains Element  //input[@class='form-control with-primary-addon']
    Click Element  //input[@class='form-control with-primary-addon']
    Input Text  //input[@class='form-control with-primary-addon']    alpha
    ${Keywords}=  Get Text  //div[@id="data-table"]//tbody/tr[1]/td[2]//span[1]
    Should Match  ${Keywords}    Alpha*
    Capture Page Screenshot

    Click Element  //div[@id="data-table"]//table/tbody/tr[1]/td[2]
    Wait Until Page Contains Element  //div[@id="data-table"]//table/tbody/tr[2]/td[3]
    ${aa}=  Get Text  //div[@id="data-table"]//table/tbody/tr[2]/td[3]
    Should Not Be Empty  ${aa}  
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
