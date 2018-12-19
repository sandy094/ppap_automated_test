*** Settings ***
Force Tags    Login
Suite Setup    SuiteSetup
Suite Teardown    SuiteTeardown
Resource    ../lib/resource.robot
Resource    ../keyword/keyword_common.robot
Resource    ../keyword/keyword_reports.robot

*** Test Cases ***
Check login
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}

Check sidebar link Operational navigation is correct
    Wait Until Page Contains Element    //div[@class='container bg-white boss-know-panel']//button[1]
    Click Element  //div[@class='container bg-white boss-know-panel']//button[1]
    Check Operational Information Link    报表呈现

Click Search
    Sleep    20s
    ${CheckValueA}=  Get Text  //table[@id="TrendInfoTable"]//tbody/tr[1]/td[2]  #驗證數值
    @{days}  Set Variable    本周  上周  本月  上月  昨日
    :FOR  ${day}  IN  @{days}
    \  Quick Search botton    ${day}
    \  Check Value Is Active
    \  Sleep    5s
    \  ${CheckValueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[3]  #驗證數值
    \  Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  ${CheckValueA}=  Set Variable  ${CheckValueB}

    ${CheckValueA}=  Get Text  //table[@id="TrendInfoTable"]//tbody/tr[1]/td[2]  #驗證數值
    @{years}  Set Variable  本年  去年  本季  上季
    :FOR  ${year}  IN  @{years}
    \  Quick Search In Year And Season    ${year}
    \  Check Value Is Active
    \  Sleep    1m
    \  ${CheckValueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]  #驗證數值
    \  Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  ${CheckValueA}=  Set Variable  ${CheckValueB}


Search In Datetime 
    ${CheckValueA}=  Get Text  //table[@id="TrendInfoTable"]//tbody/tr[1]/td[2]
    @{mounths}    Set Variable    0: 2018年12月  1: 2018年11月  2: 2018年10月  3: 2018年9月  4: 2018年8月  5: 2018年7月  6: 2018年6月  7: 2018年5月  8: 2018年4月  9: 2018年3月  10: 2018年2月  11: 2018年1月  12: 2017年12月
    :FOR    ${month}  IN  @{mounths}
    \  Search In Month    ${month}
    \  Sleep    50s
    \  ${CheckValueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
    \  Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  ${CheckValueA}=  Set Variable  ${CheckValueB}

Search In Category
    Reload Page
    Sleep    10s
    ${valueA}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
    @{categeories}  Set variable    p体育-1  p视讯-2  p机率-3  p彩票-4  p捕鱼-36  p棋牌-44
    :FOR  ${category}  IN  @{categeories}
    \  Sleep  5s
    \  Wait Until Page Contains Element    //div[@class="filter-type"]/div[contains(.,' 游戏筛选')]
    \  Click Element    //div[@class="filter-type"]/div[contains(.,' 游戏筛选')]
    \  sleep  5s
    \  Wait Until Page Contains Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'种类查询')]
    \  Click Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'种类查询')]
    \  Sleep  5s
    \  Click Element    //app-game-filter-drop-down//button[contains(.,' 清除 ')]
    \  Wait Until Page Contains Element    //label[@for="${category}"]/div
    \  Click Element    //label[@for="${category}"]/div
    \  Click Element    //app-game-filter-drop-down//button[contains(.,' 查詢 ')]
    \  Sleep    10s
    \  Capture Page Screenshot
    \  ${valueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
    \  Should Not Match    ${valueA}  ${valueB}
    \  Check the time if choose game

Search In Classification
    Reload Page
    Sleep    10s
    Wait Until Page Contains Element    //div[@class="filter-type"]/div[contains(.,' 游戏筛选')]
    Click Element    //div[@class="filter-type"]/div[contains(.,' 游戏筛选')]
    Sleep    2s
    Wait Until Page Contains Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'类型查询')]
    Click Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'类型查询')]
    Wait Until Page Contains Element    //label[@for='pAB-17']//label
    Click Element     //label[@for='pAB-17']//label
    Wait Until Page Contains Element    //app-game-hall-tab//div[@class='bamenu_btn_area']//button[contains(.,' 查詢 ')]
    Click Element    //app-game-hall-tab//div[@class='bamenu_btn_area']//button[contains(.,' 查詢 ')]
    Sleep    2s
    Check the time if choose game
    
Search In Game
    Reload Page
    Sleep    10s
    Wait Until Page Contains Element    //div[@class="filter-type"]/div[contains(.,' 游戏筛选')]
    Click Element    //div[@class="filter-type"]/div[contains(.,' 游戏筛选')]
    Sleep    2s
    Wait Until Page Contains Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'游戏查询')]
    Click Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'游戏查询')]
    Input Text    //app-game-select-tab/div/div/input    1
    Wait Until Page Contains Element  //button[@id='ngb-typeahead-0-2']
    Click Element    //button[@id='ngb-typeahead-0-2']
    Wait Until Page Contains Element    //app-game-select-tab//div[@class='game-search-panel']//button[@class='btn btn-primary']
    Click Element    //app-game-select-tab//div[@class='game-search-panel']//button[@class='btn btn-primary']
    Sleep    4s
    Capture Page Screenshot

Search In Collection
    Reload Page
    Sleep    10s
    Wait Until Page Contains Element    //div[@class="filter-type"]/div[contains(.,' 游戏筛选')]
    Click Element    //div[@class="filter-type"]/div[contains(.,' 游戏筛选')]
    Sleep    2s
    Wait Until Page Contains Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'游戏查询')]
    Click Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'游戏查询')]
    Wait Until Page Contains Element    //app-game-select-tab//div[@class='game-search-panel']//div[@class='link-line small']
    Click Element    //app-game-select-tab//div[@class='game-search-panel']//div[@class='link-line small']
    Click Element    //app-game-select-tab//div[@class='loveList-select mt-2 mb-3']/button[2]
    Wait Until Page Contains Element    //app-game-select-tab//div[@class='loveList-search-panel active']//button[contains(.,'查询')]
    Click Element    //app-game-select-tab//div[@class='loveList-search-panel active']//button[contains(.,'查询')]
    Sleep    4s
    Capture Page Screenshot
    Execute JavaScript  window.document.documentElement.scrollTop = 550;
    Capture Page Screenshot

Search In Site 
    Reload Page
    Sleep    5s
    ${valueA}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
    Wait Until Page Contains Element      //div[@class="filter-site"]/div[contains(.,' 站台筛选')]
    Click Element      //div[@class="filter-site"]/div[contains(.,' 站台筛选')]
    Wait Until Page Contains Element      //a[@class='ng2-smart-sort-link sort'][contains(.,'取消全选')]
    Click Element    //a[@class='ng2-smart-sort-link sort'][contains(.,'取消全选')]
    Wait Until Page Contains Element      //div[@id='unselectTable']//tbody/tr[8]/td[1]//span
    Click Element    //div[@id='unselectTable']//tbody/tr[8]/td[1]//span
    Click Element    //div[@class='send-btn p-2 mb-2']/button
    Sleep    2s
    Capture Page Screenshot
    ${valueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
    Should Not Match    ${valueA}  ${valueB}
    Check the time if choose game

Search In Group
    Reload Page
    Sleep   5s
    Wait Until Page Contains Element     //div[@class="filter-site"]/div[contains(.,' 站台筛选')]
    Click Element    //div[@class="filter-site"]/div[contains(.,' 站台筛选')]
    Wait Until Page Contains Element    //div[@class='site-select-panel']/span
    Click Element    //div[@class='site-select-panel']/span
    Wait Until Page Contains Element     //table[@class='table table-striped mt-3']/tbody/tr[1]/td
    Click Element    //table[@class='table table-striped mt-3']/tbody/tr[1]/td
    Click Element    //div[@class='send-btn mt-2 p-2 mb-2']/button
    Sleep    2s
    Capture Page Screenshot
    

*** Keywords ***
SuiteSetup
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    # Set Window Size    1920  980
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    
SuiteTeardown
    Run Keyword If Any Tests Failed    Capture Page Screenshot 
    Close Browser
