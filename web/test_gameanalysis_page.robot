*** Settings ***
Force Tags    Login
Suite Setup    SuiteSetup
Suite Teardown    SuiteTeardown
Resource    ../lib/resource.robot
Resource    ../keyword/keyword_common.robot
Resource    ../keyword/keyword_gameanalysis.robot

*** Test Cases ***
Check login
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}

Check sidebar link Game Information navigation is correct
     # 關掉公告訊息提示
    # Wait Until Page Contains Element    //div[@class='container bg-white boss-know-panel']//button[1]
    # Click Element  //div[@class='container bg-white boss-know-panel']//button[1]
    Click Sidebar Link    运营看板
    Set Browser Implicit Wait    10s
    Check Game Information Link    游戏解析

Click Quick Search
    Sleep    10s
    ${valueB}    Set Variable    0
    @{days}  Set Variable      昨日  上周  本月  上月
    :FOR  ${day}  IN  @{days}
    \  Quick Search botton    ${day}
    \  Sleep  5s
    \  Check Values
    \  ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[1]/td[3]   #有效投注
    \  ${result}=  Run Keyword And Return Status   Should Not Match    ${valueA}  ${valueB}
    \  Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    \  ${valueB}  Set Variable    ${valueA}
   
Click Quick Search In Year 
    ${valueB}    Set Variable    0
    @{seasons}  Set Variable  本年  去年  本季  上季
    :FOR  ${season}  IN  @{seasons}
    \  Quick Search In year and season    ${season}
    \  Sleep  30s
    \  Check Values
    \  ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[1]/td[3]
    \  ${result}=  Run Keyword And Return Status   Should Not Match    ${valueA}  ${valueB}
    \  Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    \  ${valueB}  Set Variable    ${valueA}

Search In Datetime 
    Sleep  5s
    ${valueB}    Set Variable    0
    @{mounths}    Set Variable    0: 2019年3月  1: 2019年2月  2: 2019年1月  3: 2018年12月  4: 2018年11月  5: 2018年10月  6: 2018年9月  7: 2018年8月  
    :FOR    ${month}  IN  @{mounths}
    \  Search In Month    ${month}
    \  Sleep    10s
    \  Check Values
    \  ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[1]/td[3]
    \  ${result}=  Run Keyword And Return Status   Should Not Match    ${valueA}  ${valueB}
    \  Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    \  ${valueB}  Set Variable    ${valueA}

Search In Category
    Reload Page
    Sleep    10s
    ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[2]
    @{categeories}  Set variable    p体育-1  p视讯-2  p机率-3  p彩票-4  p捕鱼-36  p棋牌-44
    :FOR  ${category}  IN  @{categeories}
    \  Sleep  5s
    \  Wait Until Page Contains Element    //div[@class="filter-type"]/div/span[contains(.,'游戏筛选')]
    \  Click Element    //div[@class="filter-type"]/div/span[contains(.,'游戏筛选')]
    \  sleep  5s
    \  Wait Until Page Contains Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'种类查询')]
    \  Click Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'种类查询')]
    \  Sleep  5s
    \  Wait Until Page Contains Element    //label[@for="${category}"]/div
    \  Click Element    //label[@for="${category}"]/div
    \  Click Element    //app-category-tab/div[@class='bamenu_btn_area']/button[contains(.,' 查询 ')]
    \  Sleep    10s
    \  Capture Page Screenshot
    \  ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[3]
    \  ${result}=  Run Keyword And Return Status   Should Not Match    ${valueA}  ${valueB}
    \  Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    \  Check the time if choose game


Search In Classification
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot
    Reload Page
    Sleep    10s
    ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[2]
    @{gameHalls}  Set variable    p3Sing-13  pAB-17  
    :FOR  ${gameHall}  IN  @{gameHalls}
    \  Reload Page
    \  Sleep  5s
    \  Wait Until Page Contains Element    //div[@class="filter-type"]/div/span[contains(.,'游戏筛选')]
    \  Click Element    //div[@class="filter-type"]/div/span[contains(.,'游戏筛选')]
    \  Sleep  5s
    \  Wait Until Page Contains Element  //label[@for='${gameHall}']/div
    \  Click Element    //label[@for='${gameHall}']/div
    \  Click Element    //app-game-hall-tab/div[@class='bamenu_btn_area']/button[contains(.,' 查询 ')]
    \  Sleep  5s
    \  ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[3]   #驗證數值
    \  ${result}=  Run Keyword And Return Status   Should Not Match    ${valueA}  ${valueB}
    \  Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    \  Check the time if choose game
 
Search In Game 
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot
    Sleep    10s
    ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[2]   #驗證數值
    Wait Until Page Contains Element    //div[@class="filter-type"]/div
    Click Element    //div[@class="filter-type"]/div
    Wait Until Page Contains Element  //div[@class="text-center mobile_btn_area2"]/a[contains(.,'游戏查询')]
    Click Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'游戏查询')]

    Wait Until Page Contains Element    //app-game-select-tab/div/div/div[contains(.,'依游戏查询')]
    Click Element    //app-game-select-tab/div/div/div[contains(.,'依游戏查询')]
    Input Text  //input[@id="searchKey"]    1
    Sleep  5s
    Wait Until Page Contains Element  //button[@id='ngb-typeahead-0-1']
    Click Element  //button[@id='ngb-typeahead-0-1']
    Click Element  //div[@class='game-search-panel']//button[contains(.,'查询')]
    Sleep  5s
    ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[7]   #驗證數值
    ${result}=  Run Keyword And Return Status   Should Not Match    ${valueA}  ${valueB}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    Check the time if choose game

Search In Collection
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot
    Reload Page
    Sleep  10s
    Set Browser Implicit Wait    10s
    Wait Until Page Contains Element    //div[@class="filter-type"]/div
    Click Element    //div[@class="filter-type"]/div
    Wait Until Page Contains Element  //div[@class="text-center mobile_btn_area2"]/a[contains(.,'游戏查询')]
    Click Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'游戏查询')]
    
    Sleep    5s
    Wait Until Page Contains Element    //app-game-select-tab//div[@class='loveList__select__wrp']/button[2]
    Click Element    //app-game-select-tab//div[@class='loveList__select__wrp']/button[2]
    Click Element    //div[@class='loveList-search-panel active']//button[contains(.,'查询')]
    Sleep    5s
    # 確認收藏集是否有變更
    Page Should Contain Element    //div[@class='col-lg-12 col-12 text-center mobile_btn_area2 pl-0 pr-0']/a[1][contains(.,' 收藏集游戏查询 ')]
    Sleep    5s
    Check the time if choose game

New Field
    Wait Until Page Contains Element    //ba-card[@id='analysis-main-panel']//div/span[@class='add-field-border']/i
    Click Element    //ba-card[@id='analysis-main-panel']//div/span[@class='add-field-border']/i
    Wait Until Page Contains Element    //ba-card[@id='analysis-main-panel']//div[@class='add-field-item']/label[@for='b0'][contains(.,'推荐排序')]
    Click Element    //ba-card[@id='analysis-main-panel']//div[@class='add-field-item']/label[@for='b0'][contains(.,'推荐排序')]
    Sleep    5s
    Click Element    //ba-card[@id='analysis-main-panel']//div[@class='add-field-item']/label[@for='a6'][contains(.,' 点击数')]
    Sleep    5s
    Click Element    //ba-card[@id='analysis-main-panel']//div[@class='add-field-item']/label[@for='a7'][contains(.,' 流失率')]
    Click Element    //ba-card[@id='analysis-main-panel']//div/span[@class='add-field-border']/i
    Sleep    5s
    Page Should Contain Element    //div[@id='tableData']/table/thead/tr/td[@class='hotrank-td']
    Page Should Contain Element    //div[@id='tableData']/table/thead/tr/td[@class='click-td']
    Page Should Contain Element    //div[@id='tableData']/table/thead/tr/td[@class='percentage-td']

Modularization
    # 展開圖表
    Sleep    10s
    Wait Until Page Contains Element  //div[@id='tableData']//tbody/tr[2]
    Click Element  //div[@id='tableData']//tbody/tr[2]
    Wait Until Page Contains Element  //div[@class='chart-area']//canvas

    Sleep  5s
    Mouse Over  //div[@class='chart-area']//canvas
    Capture Page Screenshot

    Click Element  //div[@class='slidechart']//div[@class='btn-group dropdown']/button[contains(.,'损益')]
    Wait Until Page Contains Element  //div[@class='slidechart']//ul/li[contains(.,'有效投注')]
    Click Element  //div[@class='slidechart']//ul/li[contains(.,'有效投注')]
    Sleep  5s
    Capture Page Screenshot
    Click Element  //div[@class='slidechart']//button[contains(.,'有效投注')]
    Wait Until Page Contains Element  //div[@class='slidechart']//ul/li[contains(.,'投注单量')]
    Click Element  //div[@class='slidechart']//ul/li[contains(.,'投注单量')]
    Sleep  5s
    Capture Page Screenshot

    Click Element  //div[@class='slidechart']//button[contains(.,'投注单量')]
    Wait Until Page Contains Element  //div[@class='slidechart']//ul/li[contains(.,'游戏人次')]
    Click Element  //div[@class='slidechart']//ul/li[contains(.,'游戏人次')]
    Sleep  5s
    Capture Page Screenshot

    Click Element  //div[@class='slidechart']//button[contains(.,'游戏人次')]
    Wait Until Page Contains Element  //div[@class='slidechart']//ul/li[contains(.,'营收比')]
    Click Element  //div[@class='slidechart']//ul/li[contains(.,'营收比')]
    Sleep  5s
    Capture Page Screenshot

*** Keywords ***
SuiteSetup
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    # Set Window Size    1920    1080
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    Set Browser Implicit Wait    10s
    
SuiteTeardown
    Run Keyword If Any Tests Failed    Capture Page Screenshot    
    Close Browser
