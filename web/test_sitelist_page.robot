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
    Wait Until Page Contains Element    //div[@class='container bg-white boss-know-panel']//button[1]
    Click Element  //div[@class='container bg-white boss-know-panel']//button[1]
    Sleep    10s
    Click Sidebar Link    运营看板
    Check Operational Information Link    站台列表

# driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
Click Search
    Sleep    10s
    @{days}  Set Variable   昨日  本周  上周  本月  上月
    :FOR  ${day}  IN  @{days}
    \  Quick Search botton    ${day}
    \  Check Values

    @{years}  Set Variable  本年  去年  本季  上季
    :FOR  ${year}  IN  @{years}
    \  Quick Search In year and season    ${year}
    \  Check Values
    
Check Trend 
    # 趨勢
    Wait Until Element Is Visible   //div[@class="baDateform btn-group hidden_991"]/a[contains(.,'昨日')]  
    Click Link    //div[@class="baDateform btn-group hidden_991"]/a[contains(.,'昨日')] 
    @{trs}  Set Variable  1  2  3  
    :FOR  ${tr}  IN  @{trs}
    \  trend  ${tr}

Short
    Reload Page
    Sleep    10s
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
    @{mounths}    Set Variable    0: 2019年3月  1: 2019年2月  2: 2019年1月  3: 2018年12月  4: 2018年11月  5: 2018年10月  6: 2018年9月  7: 2018年8月  
    :FOR    ${month}  IN  @{mounths}
    \  Search In Month    ${month}
    \  Check Values

Search In Game Classification
    Reload Page
    Sleep    10s
    @{labels}    Set Variable    体育-1  视讯-2  机率-3  彩票-4  棋牌-44
    :FOR    ${label}  IN  @{labels}
    \    Sleep    10s
    \    Wait Until Page Contains Element  //label[@for='${label}']  
    \    Click Element  //label[@for='${label}']
    \    Sleep    5s
    \    Wait Until Page Contains Element  //tab[@id="category"]//button[contains(.,'套用')]
    \    Click Element  //tab[@id="category"]//button[contains(.,'套用')]
    \    Sleep  5s
    \    Check Values
    \    Search In Group
    \    Reload Page
    
    Sleep    3s
    Wait Until Page Contains Element  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    ${orignalValue}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    # 單選細項
    Click Element  //label[@for='p视讯-2']
    Click Element  //label[@for='视讯-BB-1']/label
    Click Element  //label[@for='视讯-AG-6']/label
    Click Element  //tab[@id="category"]//button[contains(.,'套用')]
    Sleep    5s
    # 判斷是否有更新頁面
    ${newValue}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    ${result}=  Run Keyword And Return Status    Should Not Match  ${orignalValue}  ${newValue}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE   No Operation
    
    # 檢查趨勢圖是否顯示正常
    trend  2

Search In Game Hall
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot
    Reload Page
    Sleep    10s
    # 查BBIN
    ${orignalValue}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    Click Element  //li[contains(.,'类型')] 

    Click Element  //label[@for='pBB-1']/div/label
    Click Element  //tab[@id="gamehall"]//button[contains(.,'套用')]
    Sleep    5s
    # 判斷是否有更新頁面
    ${newValue}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    ${result}=  Run Keyword And Return Status    Should Not Match  ${orignalValue}  ${newValue}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE   No Operation

    # 查BBIN-彩票
    ${orignalValue}=    Set Variable    ${newValue}
    Click Element  //label[@for='pBB-1']/div/label
    Click Element  //label[@for='BB-彩票-4']/label
    Click Element  //tab[@id="gamehall"]//button[contains(.,'套用')]
    Sleep    5s
    # 判斷是否有更新頁面
    ${newValue}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    ${result}=  Run Keyword And Return Status    Should Not Match  ${orignalValue}  ${newValue}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE   No Operation
    trend  2

    # 查看AG视讯
    Wait Until Page Contains Element  //tab[@id="gamehall"]//button[contains(.,'清除/全选')]
    Click Element  //tab[@id="gamehall"]//button[contains(.,'清除/全选')]
    Wait Until Page Contains Element  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    ${orignalValue}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    Click Element  //label[@for='pAG-6']
    Click Element  //label[@for='AG-视讯-16']/label
    Click Element  //tab[@id="gamehall"]//button[contains(.,'套用')]
    Sleep    6s
    # 判斷是否有更新頁面
    ${newValue}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    ${result}=  Run Keyword And Return Status    Should Not Match  ${orignalValue}  ${newValue}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE   No Operation

    ${orignalValue}  Set Variable    ${newValue}
    Click Element  //a[@class='nor_tabs mt-0'][contains(.,'分群')]
    ${newValue}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    ${result}=  Run Keyword And Return Status    Should Not Match  ${orignalValue}  ${newValue}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE   No Operation
    
Search In Game Name
    Reload Page
    Sleep    10s
    Wait Until Page Contains Element  //li[contains(.,'游戏查询')]
    Click Element    //li[contains(.,'游戏查询')]
    Input Text  //input[@class='form-control']    足球之巅H5
    Wait Until Page Contains Element  //button[@id='ngb-typeahead-0-0']
    Click Element  //button[@id='ngb-typeahead-0-0']
    Wait Until Page Contains Element  //div[@class='show_pick_left']
    Click Element  //div[@class='show_pick_left']
    Sleep    10s
    Wait Until Page Contains Element  //div[@class='inner']//table/tbody/tr[1]/td[1]  
    ${B}=  Get Text  //div[@class='inner']//table/tbody/tr[1]/td[1]
    Should Not Be Empty  ${B}
    Capture Page Screenshot

Search In Keywords
    Sleep    5s
    Wait Until Page Contains Element    //input[@placeholder='站台快搜...']
    Click Element    //input[@placeholder='站台快搜...']
    Input Text    //input[@placeholder='站台快搜...']    alpha
    Set Browser Implicit Wait    5s
    ${keywordValue}=    Get Text    //div[@id="data-table"]//tbody/tr[1]/td[2]//span[1]
    Should Match    ${keywordValue}  Alpha*
    Capture Page Screenshot

    Clear Element Text    //input[@placeholder='站台快搜...']
Check In Group
    Wait Until Page Contains Element  //a[@class='nor_tabs mt-0'][contains(.,'分群')]
    Click Element  //a[@class='nor_tabs mt-0'][contains(.,'分群')]
    Sleep    10s
    Wait Until Page Contains Element  //input[@placeholder='分群快搜...']
    Click Element  //input[@placeholder='分群快搜...']
    Input Text  //input[@placeholder='分群快搜...']   alpha
    ${Keywords}=  Get Text  //div[@id="data-table"]//tbody/tr[1]/td[2]//span[1]
    Should Match  ${Keywords}    Alpha*
    Capture Page Screenshot

    Click Element  //div[@id="data-table"]//table/tbody/tr[1]/td[2]//div[@class="text-right"]/span
    Wait Until Page Contains Element  //div[@id="data-table"]//table/tbody/tr[2]/td[3]
    ${searchValue}=  Get Text  //div[@id="data-table"]//table/tbody/tr[2]/td[3]
    Should Not Be Empty  ${searchValue}  
    Capture Page Screenshot

    trend  2

Search In Moudle
    Reload Page
    ${orignalValue}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    Wait Until Page Contains Element  //div[@bacardclass='table-panel']//div[@class="button-list"][3]
    Click Element  //div[@bacardclass='table-panel']//div[@class="button-list"][3]
    Sleep  5s
    Wait Until Page Contains Element    //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    ${newValue}=  Get Text    //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    Should Not Be Empty    //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    Should Not Match  ${orignalValue}  ${newValue}

*** Keywords ***
SuiteSetup
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    Set Browser Implicit Wait    10s
    
SuiteTeardown
    Run Keyword If Any Tests Failed    Capture Page Screenshot   
    Close Browser
