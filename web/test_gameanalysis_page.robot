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
    Wait Until Page Contains Element    //div[@class='container bg-white boss-know-panel']//button[1]
    Click Element  //div[@class='container bg-white boss-know-panel']//button[1]
    Click Sidebar Link    运营看板
    Set Browser Implicit Wait    10s
    Check Game Information Link    游戏解析

Click Quick Search
    Sleep    10s
    ${valueB}    Set Variable    0
    @{days}  Set Variable      昨日  上周  本月  上月
    :FOR  ${day}  IN  @{days}
    \  Quick Search botton    ${day}
    \  Sleep  10s
    \  Check Values
    # \  Capture Page Screenshot
    \  ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[1]/td[3]
    \  Should Not Match    ${valueA}  ${valueB}
    \  ${valueB}  Set Variable    ${valueA}
   
Click Quick Search In Year 
    ${valueB}    Set Variable    0
    @{seasons}  Set Variable  本年  去年  本季  上季
    :FOR  ${season}  IN  @{seasons}
    \  Quick Search In year and season    ${season}
    \  Sleep  30s
    \  Check Values
    \  ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[1]/td[3]
    \  Should Not Match    ${valueA}  ${valueB}
    \  ${valueB}  Set Variable    ${valueA}

Search In Datetime 
    Sleep  5s
    ${valueB}    Set Variable    0
    @{mounths}    Set Variable    0: 2018年11月  1: 2018年10月  2: 2018年9月  3: 2018年8月  4: 2018年7月  5: 2018年6月  
    :FOR    ${month}  IN  @{mounths}
    \  Search In Month    ${month}
    \  Sleep    10s
    \  Check Values
    \  ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[1]/td[3]
    \  Should Not Match    ${valueA}  ${valueB}
    \  ${valueB}  Set Variable    ${valueA}


    Reload Page

Search In Category
    Sleep    10s
    ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[1]/td[3]
    @{categeories}  Set variable    CATEGORY-.1  CATEGORY-.2  CATEGORY-.3  CATEGORY-.4  CATEGORY-.5  CATEGORY-.6
    :FOR  ${category}  IN  @{categeories}
    \  Wait Until Page Contains Element    //div[@class="filter-type"]/div
    \  Click Element    //div[@class="filter-type"]/div
    \  Wait Until Page Contains Element    //label[@for='${category}']
    \  Click Element    //label[@for='${category}']
    \  Click Element    //button[@class="btn btn-primary submit"]
    \  Sleep    10s
    \  ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[1]/td[3]
    \  Should Not Match    ${valueA}  ${valueB}
    \  ${valueB}  Set Variable    ${valueA}


Search In Classification
    Sleep    10s
    ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[1]/td[3]
    
    @{gameHalls}  Set variable    GAMEHALL-.0.0  GAMEHALL-.0.1  GAMEHALL-.0.2  GAMEHALL-.0.3  GAMEHALL-.0.4
    :FOR  ${gameHall}  IN  @{gameHalls}
    \  Wait Until Page Contains Element    //div[@class="filter-type"]/div
    \  Click Element    //div[@class="filter-type"]/div
    \  Wait Until Page Contains Element  //div[@class="text-center mobile_btn_area2"]/a[contains(.,'类型查询')]
    \  Click Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'类型查询')]
    \  Sleep  3s
    \  Wait Until Page Contains Element  //label[@for='${gameHall}']
    \  Click Element    //label[@for='${gameHall}']
    \  Click Element    //button[@class="btn btn-primary submit"]
    \  Sleep  3s
    \  ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[1]/td[3]
    \  Should Not Match    ${valueA}  ${valueB}
    \  ${valueB}  Set Variable    ${valueA}
 
Search In Game Name
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot
    Set Browser Implicit Wait    10s
    ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[1]/td[3]
    Wait Until Page Contains Element    //div[@class="filter-type"]/div
    Click Element    //div[@class="filter-type"]/div
    Wait Until Page Contains Element  //div[@class="text-center mobile_btn_area2"]/a[contains(.,'游戏查询')]
    Click Element    //div[@class="text-center mobile_btn_area2"]/a[contains(.,'游戏查询')]

    Input Text  //input[@id="searchKey"]    8
    Sleep  5s
    Wait Until Page Contains Element  //button[@id='ngb-typeahead-0-1']
    Click Element  //button[@id='ngb-typeahead-0-1']
    Click Element  //div[@class='game-search-panel']//button[contains(.,'套用')]
    Sleep  5s
    ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[1]/td[3]
    Should Not Match    ${valueA}  ${valueB}
    Capture Page Screenshot

   
    Reload Page

Modularization
    Sleep    10s
    Wait Until Page Contains Element  //div[@id='tableData']//tbody/tr[2]
    Click Element  //div[@id='tableData']//tbody/tr[2]
    Wait Until Page Contains Element  //div[@class='chart-area']//canvas

    Sleep  5s
    Mouse Over  //div[@class='chart-area']//canvas
    Capture Page Screenshot

    Click Element  //div[@class='slidechart']//button[contains(.,'損益')]
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
    Wait Until Page Contains Element  //div[@class='slidechart']//ul/li[contains(.,'活跃会员')]
    Click Element  //div[@class='slidechart']//ul/li[contains(.,'活跃会员')]
    Sleep  5s
    Capture Page Screenshot

    Click Element  //div[@class='slidechart']//button[contains(.,'活跃会员')]
    Wait Until Page Contains Element  //div[@class='slidechart']//ul/li[contains(.,'营收比')]
    Click Element  //div[@class='slidechart']//ul/li[contains(.,'营收比')]
    Sleep  5s
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
