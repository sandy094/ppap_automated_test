*** Settings ***
Force Tags    Login
Suite Setup    SuiteSetup
Suite Teardown    SuiteTeardown
Resource    ../lib/resource.robot
Resource    ../keyword/keyword_common.robot
Resource    ../keyword/keyword_newdashboard.robot

*** Test Cases ***
Check login
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}

Check sidebar link Dashboard navigation is correct
    # 關掉公告訊息提示
    # Wait Until Page Contains Element    //div[@class='container bg-white boss-know-panel']//button[1]
    # Click Element  //div[@class='container bg-white boss-know-panel']//button[1]
    Sleep    10s
    # Click Element  //div[@class='modal-content']//div/i
    Click Element  //div[@class='loader-panel load-xs-go p-2']/i
    Check Topbar Link    综合看板
    No Operation

Check Search For Basic
    Set Browser Implicit Wait    10s
    @{days}  Set Variable  上月  昨日  本周  上周  本月  
    :FOR  ${day}  IN  @{days}
    \  Sleep  5s
    \  Click Element  //a[@class='active-bright']
    \  Quick Search botton    ${day}
    \  Verify Basic Table Is Active
    \  Verify Basic Information Table Is Active
    \  Verify SiteRank Value For Basic
    \  Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,'游戏 ')]
    \  Capture Page Screenshot
    \  Reload Page

    @{seasons}  Set Variable  本年  去年  本季  上季
    :FOR  ${season}  IN  @{seasons}
    \  Sleep  5s
    \  Click Element  //a[@class='active-bright']
    \  Quick Search In year and season    ${season}
    \  Verify Basic Table For Years
    \  Verify Basic Information Table For Years
    \  Verify SiteRank Value For Basic  
    \  Reload Page

Check Save Search
    Set Browser Implicit Wait    10s
    @{days}  Set Variable  昨日  本周  上周  本月  上月  
    :FOR  ${day}  IN  @{days}
    \  Sleep  5s
    \  Quick Search botton  ${day}
    \  Verify Save Page Is Active

    @{seasons}  Set Variable  本年  去年  本季  上季
    :FOR  ${season}  IN  @{seasons}
    \  Sleep  5s
    \  Click Element  //a[@class='active-bright']
    \  Quick Search In year and season    ${season}
    \  Verify Save Page Is Active

Search In Datetime For Basic
    Set Browser Implicit Wait    10s
    @{mounths}    Set Variable    0: 2018年9月  1: 2018年8月  2: 2018年7月  3: 2018年6月  4: 2018年5月  5: 2018年4月  6: 2018年3月  7: 2018年2月  8: 2018年1月  9: 2017年12月  10: 2017年11月  11: 2017年10月  12: 2017年9月
    :FOR    ${month}  IN  @{mounths}
    \  Sleep  10s
    \  Click Element  //a[@class='active-bright']
    \  Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,' 逐日 ')]
    \  Search In Month    ${month}
    \  Verify Basic Table Is Active
    \  Verify SiteRank Value For Basic  
    \  Reload Page

Search In Datetime For Save
    # 存提
    Set Browser Implicit Wait    10s
    # Click Element  //a[@class='active-bright']
    # Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,' 逐日 ')]
    @{mounths}    Set Variable    0: 2018年9月  1: 2018年8月  2: 2018年7月  3: 2018年6月  4: 2018年5月  5: 2018年4月  6: 2018年3月  7: 2018年2月  8: 2018年1月  9: 2017年12月  10: 2017年11月  11: 2017年10月  12: 2017年9月
    :FOR    ${month}  IN  @{mounths}
    \  Sleep  10s
    \  Wait Until Page Contains Element  //a[@class='active-bright']
    \  Click Element  //a[@class='active-bright']
    \  Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,' 逐日 ')]
    \  Search In Month    ${month}
    \  Verify Save Page Is Active

Check Chart is active
    # 只檢查昨日的圖表
    Reload Page
    Sleep    15s
    Wait Until Page Contains Element  //a[@class='active-bright']
    Click Element  //a[@class='active-bright']
    Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,'游戏 ')]
    Chart Transform
    Capture Page Screenshot
    Check Chart In Game Classification    种类
    Check Chart In Game Station    娱乐城
    Reload Page

Short
    Reload Page
    Sleep  10s
    Click Element  //a[@class='active-bright']
    Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,'站台 ')]
    Wait Until Page Contains Element  //div[@class="kanban-title"]/div/a/a
    Click Element  //div[@class="kanban-title"]/div/a/a
    @{number}  Set variable  4  5  6  7  3
    :FOR  ${num}  IN  @{number}
    \  Click Element  //ng2-smart-table[@id="siteRank"]/table/thead/tr[1]/th[${num}]//span
    \  Sleep  5s
    \  ${ValueA}=  Get Text  //ng2-smart-table[@id="siteRank"]/table/tbody/tr[1]/td[${num}]
    \  ${ValueB}=  Get Text  //ng2-smart-table[@id="siteRank"]/table/tbody/tr[2]/td[${num}]
    \  ${ValueA}=    Remove String    ${ValueA}    ,
    \  ${ValueB}=    Remove String    ${ValueB}    ,
    \  Convert To Integer    ${ValueA}
    \  Convert To Integer    ${ValueB}
    \  Should Be True  ${ValueA}>${ValueB}
    Capture Page Screenshot

Advanced Search-category
    # 進階搜尋-種類
    Sleep  2s
    ${CheckValueA}=  Get Text  //div[@class='kanban-everyDay-panel mt-2 mb-3']//table/tbody/tr[1]/td[2]
    @{cates}  Set variable  棋牌  彩票   视讯  体育   机率 
    :FOR  ${cate}  IN  @{cates}
    \  Sleep    10s
    \  Wait Until Page Contains Element  //div[@class='mt-2 mb-2']/button[contains(.,'${cate}')]
    \  Click Element  //div[@class='mt-2 mb-2']/button[contains(.,'${cate}')]
    \  Click Element  //div[@class='mt-2 text-right']/button
    \  Page Should Contain Element  //div[@class='kanban-title']/div[contains(.,'${cate}')]
    \  Sleep  3s
    \  Wait Until Page Contains Element  //div[@class='kanban-everyDay-panel mt-2 mb-3']//table/tbody/tr[1]/td[2]  10s
    \  ${CheckValueB}=  Get Text  //div[@class='kanban-everyDay-panel mt-2 mb-3']//table/tbody/tr[1]/td[2]
    \  Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  Reload Page

Advanced Search-station
    # 進階搜尋-娛樂城
    Wait Until Page Contains Element  //div[@class='kanban-everyDay-panel mt-2 mb-3']//table/tbody/tr[1]/td[2]  10s
    ${CheckValueA}=  Get Text  //div[@class='kanban-everyDay-panel mt-2 mb-3']//table/tbody/tr[1]/td[2]
    @{cates}  Set variable   AG   BBIN   HB  IG   NE 
    :FOR  ${cate}  IN  @{cates}
    \  Sleep    10s
    \  Wait Until Page Contains Element  //div[@class='fast-city-select-panel']/button[contains(.,'${cate}')]
    \  Click Element  //div[@class='fast-city-select-panel']/button[contains(.,'${cate}')]
    \  Click Element  //div[@class='mt-2 text-right']/button
    \  Page Should Contain Element  //div[@class='kanban-title']/div[contains(.,'${cate}')]
    \  Sleep  3s
    \  ${CheckValueB}=  Get Text  //div[@class='kanban-everyDay-panel mt-2 mb-3']//table/tbody/tr[1]/td[2]
    \  Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  Reload Page
    

*** Keywords ***
SuiteSetup
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    
SuiteTeardown
    Run Keyword If Any Tests Failed    Capture Page Screenshot
    Close Browser
