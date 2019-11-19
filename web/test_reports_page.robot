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
    Close Announcement 
    Check Operational Information Link    报表呈现

Click Search
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot
    Sleep    20s
    ${CheckValueA}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[4]  #驗證數值 投注單量
    @{days}  Set Variable    本周  上周  本月  上月  昨日
    :FOR  ${day}  IN  @{days}
    \  Quick Search botton    ${day}
    \  Check Value Is Active
    \  Sleep    5s
    \  ${CheckValueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[4]  #驗證數值
    \  ${result}=  Run Keyword And Return Status    Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation 
    \  ${CheckValueA}=  Set Variable  ${CheckValueB}

    ${CheckValueA}=  Get Text  //table[@id="TrendInfoTable"]//tbody/tr[1]/td[2]  #驗證數值
    @{years}  Set Variable  本年  去年  本季  上季
    :FOR  ${year}  IN  @{years}
    \  Quick Search botton    ${year}
    \  Check Value Is Active
    \  Sleep    1m
    \  ${CheckValueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[4]  #驗證數值
    \  ${checkResult}=  Run Keyword And Return Status    Should Not Match    ${CheckValueB}    0
    \  Run Keyword If     '${checkResult}'=='False'    Capture Page Screenshot    ELSE    NO Operation
    \  ${statusResult}=  Run Keyword And Return Status    Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  Run Keyword If    '${result}'=='False'    Capture Page Screenshot        ELSE    NO Operation
    \  ${CheckValueA}=  Set Variable  ${CheckValueB}


Search In Datetime 
    ${CheckValueA}=  Get Text  //table[@id="TrendInfoTable"]//tbody/tr[1]/td[4]
    @{mounths}    Set Variable    0: 2019年11月  1: 2019年10月  2: 2019年9月  3: 2019年8月  
    :FOR    ${month}  IN  @{mounths}
    \  Search In Month    ${month}
    \  Sleep    50s
    \  ${CheckValueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[4]
    \  ${result}=  Run keyword And Return Status    Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    NO Operation
    \  ${CheckValueA}=  Set Variable  ${CheckValueB}

Search In Category
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot
    Reload Page
    Sleep    10s
    ${valueA}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[4]
    @{categeories}  Set variable    p体育-1  p视讯-2  p机率-3  p彩票-4  p捕鱼-42  p棋牌-44
    :FOR  ${category}  IN  @{categeories}
    \  Reload Page
    \  Sleep  10s
    \  Wait Until Page Contains Element    //div[@class="filter-type"]/div/span[contains(.,'游戏筛选')]
    \  Click Element    //div[@class="filter-type"]/div/span[contains(.,'游戏筛选')]
    \  sleep  5s
    \  Wait Until Page Contains Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'种类查询')]
    \  Click Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'种类查询')]
    \  Sleep  5s
    \  Click Element    //app-game-filter-drop-down//button[contains(.,' 清除 ')]
    \  Wait Until Page Contains Element    //label[@for="${category}"]/div
    \  Click Element    //label[@for="${category}"]/div
    \  Click Element    //app-category-tab/div[@class='bamenu_btn_area']/button[contains(.,' 查询 ')]
    \  Sleep    10s
    \  Capture Page Screenshot
    \  ${valueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[4]
    \  ${result}=  Run keyword And Return Status    Should Not Match    ${valueA}  ${valueB}    ELSE    NO Operation
    \  Check the time if choose game 

Search In Classification
    Reload Page
    Sleep    10s
    Wait Until Page Contains Element    //div[@class="filter-type"]/div/span[contains(.,'游戏筛选')]
    Click Element    //div[@class="filter-type"]/div/span[contains(.,'游戏筛选')]
    Sleep    2s
    Wait Until Page Contains Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'娱乐城查询')]
    Click Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'娱乐城查询')]
    Wait Until Page Contains Element    //label[@for='pAB-17']//label
    Click Element     //label[@for='pAB-17']//label
    Wait Until Page Contains Element    //app-game-hall-tab//div[@class='bamenu_btn_area']//button[contains(.,' 查询 ')]
    Click Element    //app-game-hall-tab//div[@class='bamenu_btn_area']//button[contains(.,' 查询 ')]
    Sleep    2s
    Check the time if choose game 
    
Search In Game
    Reload Page
    Sleep    10s
    Wait Until Page Contains Element    //div[@class="filter-type"]/div/span[contains(.,'游戏筛选')]
    Click Element    //div[@class="filter-type"]/div/span[contains(.,'游戏筛选')]
    Sleep    2s
    Wait Until Page Contains Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'游戏查询')]
    Click Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'游戏查询')]

    Input Text    //app-game-select-tab/div/div/input    1
    Sleep    5s
    Wait Until Page Contains Element  //button[@id='ngb-typeahead-0-2']
    Click Element    //button[@id='ngb-typeahead-0-2']
    Wait Until Page Contains Element    //app-game-select-tab//div[@class='game-search-panel']//button[@class='btn btn-primary']
    Click Element    //app-game-select-tab//div[@class='game-search-panel']//button[@class='btn btn-primary']
    Sleep    4s
    Check the time if choose game 

Search In Collection
    Reload Page
    Sleep    10s
    Wait Until Page Contains Element    //div[@class="filter-type"]/div/span[contains(.,'游戏筛选')]
    Click Element    //div[@class="filter-type"]/div/span[contains(.,'游戏筛选')]
    Sleep    2s
    Wait Until Page Contains Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'游戏查询')]
    Click Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'游戏查询')]
    Wait Until Page Contains Element    //app-game-select-tab//div[@class='game-search-panel']//div[@class='link-line small']
    Click Element    //app-game-select-tab//div[@class='game-search-panel']//div[@class='link-line small']
    Wait Until Page Contains Element    //app-game-select-tab//div[@class='loveList__select__wrp']/button[2]
    Sleep    5s
    Click Element    //app-game-select-tab//div[@class='loveList__select__wrp']/button[2]
    Sleep    5s
    Wait Until Page Contains Element    //div[@class="app-div-panel"]//div[@class='loveList-search-panel active']//button[contains(.,'查询')]
    Click Element    //div[@class="app-div-panel"]//div[@class='loveList-search-panel active']//button[contains(.,'查询')]
    Sleep    4s
    Capture Page Screenshot
    Execute JavaScript  window.document.documentElement.scrollTop = 550;
  
    Check the time if choose game 

Search In Site 
    Reload Page
    Sleep    5s
    ${valueA}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]  #驗證數值
    Wait Until Page Contains Element      //div[@class="filter-site"]/div/span[contains(.,'站台筛选')]
    Click Element      //div[@class="filter-site"]/div/span[contains(.,'站台筛选')]
    Wait Until Page Contains Element      //a[@class='ng2-smart-sort-link sort'][contains(.,'取消全选')]
    Click Element    //a[@class='ng2-smart-sort-link sort'][contains(.,'取消全选')]
    Wait Until Page Contains Element      //div[@id='unselectTable']//tbody/tr[8]/td[1]//span
    Click Element    //div[@id='unselectTable']//tbody/tr[8]/td[1]//span
    Click Element    //div[@class='send-btn p-2 mb-2']/button
    Sleep    2s
    Capture Page Screenshot
    ${valueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
    ${request}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    Run keyword If    '${request}'=='False'    Capture Page Screenshot    ELSE    No Operation
    Check the time if choose game

Search In Group
    Reload Page
    Sleep   5s
    Wait Until Page Contains Element     //div[@class="filter-site"]/div/span[contains(.,'站台筛选')]
    Click Element    //div[@class="filter-site"]/div/span[contains(.,'站台筛选')]
    Wait Until Page Contains Element    //div[@class='site-select-panel']/span
    Click Element    //div[@class='site-select-panel']/span
    Wait Until Page Contains Element     //table[@class='table table-striped mt-3']/tbody/tr[1]/td
    Click Element    //table[@class='table table-striped mt-3']/tbody/tr[1]/td
    Click Element    //div[@class='send-btn mt-2 p-2 mb-2']/button
    Sleep    2s
    Capture Page Screenshot
    

*** Keywords ***
SuiteSetup
    ${chrome options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome options}   add_argument    ignore-certificate-errors
    Call Method    ${chrome options}   add_argument    ignore-ssl-errors
    ${options}=     Call Method     ${chrome_options}    to_capabilities      
    Create Webdriver    Chrome    desired_capabilities=${options}
    Go to     ${LOGIN URL}
	Maximize Browser Window
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    # Open Browser    ${LOGIN URL}    ${BROWSER}
    # Maximize Browser Window
    # Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    
SuiteTeardown
    Run Keyword If Any Tests Failed    Capture Page Screenshot 
    Close Browser
