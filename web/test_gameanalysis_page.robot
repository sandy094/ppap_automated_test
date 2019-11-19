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
    Close Announcement 
    Click Sidebar Link    游戏解析

Click Quick Search
    Sleep    10s
    ${valueB}    Set Variable    0
    @{days}  Set Variable      昨日  上周  本月  上月
    :FOR  ${day}  IN  @{days}
    \  Quick Search botton    ${day}
    \  Sleep  6s
    \  Check Values
    \  ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[1]/td[5]   #投注單量
    \  ${result}=  Run Keyword And Return Status   Should Not Match    ${valueA}  ${valueB}
    \  Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    \  ${valueB}  Set Variable    ${valueA}
   
Click Quick Search In Year 
    ${valueB}    Set Variable    0
    @{seasons}  Set Variable  本年  去年  本季  上季
    :FOR  ${season}  IN  @{seasons}
    \  Quick Search botton    ${season}
    \  Sleep  30s
    \  Check Values
    \  ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[1]/td[5]
    \  ${result}=  Run Keyword And Return Status   Should Not Match    ${valueA}  ${valueB}
    \  Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    \  ${valueB}  Set Variable    ${valueA}

Search In Datetime 
    Sleep  5s
    ${valueB}    Set Variable    0
    @{mounths}    Set Variable    0: 2019年11月  1: 2019年10月  2: 2019年9月  3: 2019年8月
    :FOR    ${month}  IN  @{mounths}
    \  Search In Month    ${month}
    \  Sleep    10s
    \  Check Values
    \  ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[1]/td[5]
    \  ${result}=  Run Keyword And Return Status   Should Not Match    ${valueA}  ${valueB}
    \  Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    \  ${valueB}  Set Variable    ${valueA}

Search In Category
    Reload Page
    Sleep    10s
    #投注單量
    ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[5] 
    @{categeories}  Set variable    p体育-1  p视讯-2  p机率-3  p彩票-4  p捕鱼-42  p棋牌-44
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
    \  ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[6]
    \  ${result}=  Run Keyword And Return Status   Should Not Match    ${valueA}  ${valueB}
    \  Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    \  Check the time if choose game


Search In Classification
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot
    Reload Page
    Sleep    10s
    ${totalValue}=  Get Text    //div[@id="tableData"] //tbody/tr[3]/td[3]
    ${totalValue}=  Remove String    ${totalValue}    ,
    Convert To Integer    ${totalValue}
    ${gameHallName}=  Get Text    //div[@id="tableData"] //tbody/tr[3]/td[2]
    Sleep  8s
    Wait Until Page Contains Element    //div[@class="filter-type"]/div/span[contains(.,'游戏筛选')]
    Click Element    //div[@class="filter-type"]/div/span[contains(.,'游戏筛选')]
    Sleep  5s
    Wait Until Page Contains Element  //label[contains(.,'${gameHallName}')]/div
    Click Element    //label[contains(.,'${gameHallName}')]/div
    
    Click Element    //app-game-hall-tab/div[@class='bamenu_btn_area']/button[contains(.,' 查询 ')]
    Sleep  5s
    Capture Page Screenshot
    ${sum}  Set Variable    0
    ${detailRowCount}=  Get Element Count    //div[@id="tableData"] //tbody/tr
    ${detailRowCount}  Evaluate    ${detailRowCount}+1
    Convert To Integer    ${detailRowCount}
    :FOR  ${tr}  IN RANGE  2  ${detailRowCount}  1
    \  ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[${tr}]/td[4]   #驗證數值
    \  ${valueA}=  Remove String    ${valueA}    ,
    \  Convert To Integer    ${valueA}    
    \  ${sum}  Evaluate    ${sum}+${valueA}    
    \  Convert To Integer    ${sum}
    
    ${result}=  Run Keyword And Return Status   Should Not Match    ${sum}  ${totalValue}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    Check the time if choose game


    # @{gameHalls}  Set variable    p3Sing-13  pAB-17  
    # :FOR  ${gameHall}  IN  @{gameHalls}
    # \  Reload Page
    # \  Sleep  5s
    # \  Wait Until Page Contains Element    //div[@class="filter-type"]/div/span[contains(.,'游戏筛选')]
    # \  Click Element    //div[@class="filter-type"]/div/span[contains(.,'游戏筛选')]
    # \  Sleep  5s
    # \  Wait Until Page Contains Element  //label[@for='${gameHall}']/div
    # \  Click Element    //label[@for='${gameHall}']/div
    # \  Click Element    //app-game-hall-tab/div[@class='bamenu_btn_area']/button[contains(.,' 查询 ')]
    # \  Sleep  5s
    # \  ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[6]   #驗證數值
    # \  ${result}=  Run Keyword And Return Status   Should Not Match    ${valueA}  ${valueB}
    # \  Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    # \  Check the time if choose game
 
# Search In Game 
#     [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot
#     Sleep    15s
#     ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[5]   #驗證損益數值
#     Wait Until Page Contains Element    //div[@class="filter-type"]/div
#     Click Element    //div[@class="filter-type"]/div
#     Wait Until Page Contains Element  //div[@class="text-center mobile_btn_area2"]/a[contains(.,'游戏查询')]
#     Click Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'游戏查询')]

#     Wait Until Page Contains Element    //app-game-select-tab/div/div/div[contains(.,'依游戏查询')]
#     Click Element    //app-game-select-tab/div/div/div[contains(.,'依游戏查询')]
#     Input Text  //input[@id="searchKey"]    1
#     Sleep  10s
#     ${result}=  Run Keyword And Return Status   Wait Until Page Contains Element  //button[@id='ngb-typeahead-0-1']
#     Run Keyword If    '${result}'=='False'    Sleep    20s    ELSE    No Operation
#     Click Element  //button[@id='ngb-typeahead-0-1']
#     Click Element  //div[@class='game-search-panel']//button[contains(.,'查询')]
#     Sleep  40s
#     ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[6]   #驗證數值
#     ${result}=  Run Keyword And Return Status   Should Not Match    ${valueA}  ${valueB}
#     Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation

#     # 搜尋時間過長
#     # Check the time if choose game

# Search In Collection
#     [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot
#     Sleep  15s
#     Wait Until Page Contains Element    //div[@class="filter-type"]/div
#     Click Element    //div[@class="filter-type"]/div
#     Wait Until Page Contains Element  //div[@class="text-center mobile_btn_area2"]/a[contains(.,'游戏查询')]
#     Click Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'游戏查询')]
#     # Wait Until Page Contains Element    //div[@class="game-search-panel"]/div/div[contains(.,'依收藏集查询')]
#     # Click Element    //div[@class="game-search-panel"]/div/div[contains(.,'依收藏集查询')]
    
#     Sleep    5s
#     Wait Until Page Contains Element    //app-game-select-tab//div[@class='loveList__select__wrp']/button[2]
#     Click Element    //app-game-select-tab//div[@class='loveList__select__wrp']/button[2]
#     Sleep    5s

#     Wait Until Page Contains Element    //div[@class="app-div-panel"]//div[@class='loveList-search-panel active']//button[contains(.,'查询')]
#     Click Element    //div[@class="app-div-panel"]//div[@class='loveList-search-panel active']//button[contains(.,'查询')]
#     Sleep    5s
#     # 確認收藏集是否有變更
#     Page Should Contain Element    //div[@class='col-lg-12 col-12 text-center mobile_btn_area2 pl-0 pr-0']/a[1][contains(.,' 收藏集游戏查询 ')]
#     Sleep    5s
#     # 搜尋時間過長
#     # Check the time if choose game

# New Field
#     Wait Until Page Contains Element    //ba-card[@id='analysis-main-panel']//div/span[@class='add-field-border']/i
#     Click Element    //ba-card[@id='analysis-main-panel']//div/span[@class='add-field-border']/i
#     Sleep    5s

#     # 有效投注
#     Wait Until Page Contains Element    //div[@class='custom_field_fast_column_item']/div/span[contains(.,' 有效投注')]
#     Click Element    //div[@class='custom_field_fast_column_item']/div/span[contains(.,' 有效投注')]
#     ${checkEffectpay}=  Run Keyword And Return Status    Page Should Contain Element      //div[@class='custom_field_fast_column_item']/div[@class='item active']/span[contains(.,' 有效投注')]

#     # 推薦排序
#     Wait Until Page Contains Element    //div[@class='custom_field_fast_column_item']/div/span[contains(.,' 推荐排序')]
#     Click Element    //div[@class='custom_field_fast_column_item']/div/span[contains(.,' 推荐排序')]
#     ${checkRecomand}=  Run Keyword And Return Status    Page Should Contain Element      //div[@class='custom_field_fast_column_item']/div[@class='item active']/span[contains(.,' 推荐排序')]

#     # 熱門排序
#     Wait Until Page Contains Element    //div[@class='custom_field_fast_column_item']/div/span[contains(.,' 热门排序')]
#     Click Element    //div[@class='custom_field_fast_column_item']/div/span[contains(.,' 热门排序')]
#     ${checkHotRandom}=  Run Keyword And Return Status    Page Should Contain Element      //div[@class='custom_field_fast_column_item']/div[@class='item active']/span[contains(.,' 热门排序')]

#     # 點擊數
#     Wait Until Page Contains Element    //div[@class='custom_field_fast_column_item']/div/span[contains(.,' 点击数')]
#     Click Element    //div[@class='custom_field_fast_column_item']/div/span[contains(.,' 点击数')]
#     ${checkClickRandom}=  Run Keyword And Return Status    Page Should Contain Element      //div[@class='custom_field_fast_column_item']/div[@class='item active']/span[contains(.,' 点击数')]
    
#     Click Element    //div[@class='custom_field_save-wrp text-center']/button[contains(.,' 確定 ')]
#     Sleep    30s
#     Run Keyword If    '${checkEffectpay}'=='True'    Run Keyword And Return Status   Page Should Contain Element    //div[@id='tableData']/table/thead/tr/td[@class='effectpay-td']    ELSE    Run Keyword And Return Status   Page Should Not Contain Element    //div[@id='tableData']/table/thead/tr/td[@class='effectpay-td']
#     Run Keyword If    '${checkRecomand}'=='True'    Run Keyword And Return Status   Page Should Contain Element    //div[@id='tableData']/table/thead/tr/td[@class='hotrank-td']    ELSE    Run Keyword And Return Status   Page Should Not Contain Element    //div[@id='tableData']/table/thead/tr/td[@class='hotrank-td']
#     Run Keyword If    '${checkHotRandom}'=='True'    Run Keyword And Return Status   Page Should Contain Element    //div[@id='tableData']/table/thead/tr/td[@class='baserank-td']    ELSE    Run Keyword And Return Status   Page Should Not Contain Element    //div[@id='tableData']/table/thead/tr/td[@class='baserank-td']
#     Run Keyword If    '${checkClickRandom}'=='True'    Run Keyword And Return Status   Page Should Contain Element    //div[@id='tableData']/table/thead/tr/td[@class='click-td']    ELSE    Run Keyword And Return Status   Page Should Not Contain Element    //div[@id='tableData']/table/thead/tr/td[@class='click-td']
    
#     Capture Page Screenshot
# Modularization
#     # 展開圖表
#     Sleep    10s
#     Wait Until Page Contains Element  //div[@id='tableData']//tbody/tr[2]/td[@class='icon-Circles-td']
#     Click Element  //div[@id='tableData']//tbody/tr[2]/td[@class='icon-Circles-td']
#     Wait Until Page Contains Element  //div[@class='chart-area']//canvas
#     Sleep  5s
#     Mouse Over  //div[@class='chart-area']//canvas
#     Capture Page Screenshot

#     Click Element  //div[@class='slidechart']//div[@class='btn-group dropdown']/button[contains(.,'损益')]
#     Wait Until Page Contains Element  //div[@class='slidechart']//ul/li[contains(.,'有效投注')]
#     Click Element  //div[@class='slidechart']//ul/li[contains(.,'有效投注')]
#     Sleep  10s
#     Capture Page Screenshot
#     Click Element  //div[@class='slidechart']//button[contains(.,'有效投注')]
#     Wait Until Page Contains Element  //div[@class='slidechart']//ul/li[contains(.,'投注单量')]
#     Click Element  //div[@class='slidechart']//ul/li[contains(.,'投注单量')]
#     Sleep  10s
#     Capture Page Screenshot

#     Click Element  //div[@class='slidechart']//button[contains(.,'投注单量')]
#     Wait Until Page Contains Element  //div[@class='slidechart']//ul/li[contains(.,'游戏人次')]
#     Click Element  //div[@class='slidechart']//ul/li[contains(.,'游戏人次')]
#     Sleep  10s
#     Capture Page Screenshot

#     Click Element  //div[@class='slidechart']//button[contains(.,'游戏人次')]
#     Wait Until Page Contains Element  //div[@class='slidechart']//ul/li[contains(.,'营收比')]
#     Click Element  //div[@class='slidechart']//ul/li[contains(.,'营收比')]
#     Sleep  5s
#     Capture Page Screenshot

# Check Number Of Clicks
#     # Quick Search botton    上周
#     Sleep    5s
#     ${CheckClickTitle}=    Run Keyword And Return Status    Page Should Contain Element    //div[@id='tableData']/table/thead/tr/td[@class='click-td']
#     Run Keyword If    '${CheckClickTitle}'=='False'    Exit For Loop       ELSE    Click Element    //div[@id='tableData']/table/tbody/tr[2]/td[@class='click-td']/a  
#     Sleep   5s
#     ${CheckClick}=    Run Keyword And Return Status    Page Should Contain Element    //div[@id="tableData"]//table/tbody/tr[1]/td[@class='clicksum-td'][1]
#     Run Keyword If    '${CheckClick}'=='False'    Capture Page Screenshot    ELSE    No Operation

    

*** Keywords ***
SuiteSetup
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    Set Browser Implicit Wait    10s
    
SuiteTeardown
    Run Keyword If Any Tests Failed    Capture Page Screenshot    
    Close Browser
