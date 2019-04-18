*** Settings ***
Force Tags    Login
Suite Setup    SuiteSetup
Suite Teardown    SuiteTeardown
Resource    ../lib/resource.robot
Resource    ../keyword/keyword_common.robot
Resource    ../keyword/keyword_reports_mobile.robot

*** Test Cases ***
Check login
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}

Check sidebar link Operational navigation is correct
    # 關掉公告訊息提示
    Sleep    5s
    Wait Until Page Contains Element    //div[@class='container bg-white boss-know-panel']//button[1]
    Click Element  //div[@class='container bg-white boss-know-panel']//button[1]
    Sleep    5s
    Wait Until Page Contains Element    //a[@class='collapse-menu-link ion-navicon']
    Click Element    //a[@class='collapse-menu-link ion-navicon']
    Click Sidebar Link    报表呈现
    No Operation

Click Search
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot
    Sleep    10s
    Wait Until Page contains Element  //div[@class="baDateform btn-group"]/a[contains(.,'今日')]
    Click Element    //div[@class="baDateform btn-group"]/a[contains(.,'今日')]
    Sleep    5s
    ${CheckValueA}=  Get Text  //table[@id="TrendInfoTable"]//tbody/tr[1]/td[2]
    @{days}  Set Variable    本周  上周  本月  上月  昨日
    :FOR  ${day}  IN  @{days}
    \  Quick Search botton In Mobile    ${day}
    \  Check Value Is Active 
    \  Capture Page Screenshot
    \  ${CheckValueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[3]
    \  Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  ${CheckValueA}=  Set Variable  ${CheckValueB}


    ${CheckValueA}=  Get Text  //table[@id="TrendInfoTable"]//tbody/tr[1]/td[2]
    @{years}  Set Variable  本年  去年  本季  上季
    :FOR  ${year}  IN  @{years}
    \  Quick Search For Year And Season In Mobile    ${year}
    \  Check Value Is Active 
    \  Sleep    5s
    \  ${CheckValueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
    \  Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  ${CheckValueA}=  Set Variable  ${CheckValueB}
    \  Quick Search botton In Mobile    本周

Search In Datetime 
    ${CheckValueA}=  Get Text  //table[@id="TrendInfoTable"]//tbody/tr[1]/td[2]
    @{months}    Set Variable    0: 2019年4月  1: 2019年3月  2: 2019年2月  3: 2019年1月  
    :FOR  ${month}  IN  @{months}
    \  Sleep  10s
    \  Search In Mounth For Mobile    ${month}
    \  Sleep  15s
    \  ${CheckValueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
    \  Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  ${CheckValueA}=  Set Variable  ${CheckValueB}

Search In Category
    Reload Page  
    種類
    Sleep    5s
    ${valueA}=  Get Text     //div[@id='hottestInfoTable']//tbody/tr[1]/td[2]
    Wait Until Page Contains Element    //div[@class='mobile_btn_area_pos show_991']/div/button[contains(.,'游戏选单')]
    Click Element    //div[@class='mobile_btn_area_pos show_991']/div/button[contains(.,'游戏选单')]
    Sleep    2s
    # 清除列表
    Wait Until Page Contains Element    //div[@class='bamenu_btn_area']/button[1]
    Click Element    //div[@class='bamenu_btn_area']/button[1]
    Sleep    2s
    Wait Until Page Contains Element    //ba-query-menu[@class='sitelist_NAVlist']//div/label[@for='体育-1']
    Click Element    //ba-query-menu[@class='sitelist_NAVlist']//div/label[@for='体育-1']
    Click Element    //div[@class='bamenu_btn_area']/button[2]
    Sleep    2s
    Page Should Contain Element    //div[@id='hottestInfoTable']//div[@class='card-header clearfix hotdata_bgcolor'][contains(.,'最热信息:体育')]
    ${valueB}=  Get Text     //div[@id='hottestInfoTable']//tbody/tr[1]/td[2]
    ${result}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    Check the time if choose game 
    # 選種類下的廳
    Reload Page
    Sleep    5s 
    ${valueA}=  Get Text     //div[@id='hottestInfoTable']//tbody/tr[1]/td[2]
    Wait Until Page Contains Element    //div[@class='mobile_btn_area_pos show_991']/div/button[contains(.,'游戏选单')]
    Click Element    //div[@class='mobile_btn_area_pos show_991']/div/button[contains(.,'游戏选单')]
    Sleep    2s
    Wait Until Page Contains Element    //div[@class='bamenu_btn_area']/button[1]
    Click Element    //div[@class='bamenu_btn_area']/button[1]
    Sleep    2s
    Wait Until Page Contains Element    //ba-query-menu[@class='sitelist_NAVlist']//div/label[@for='p体育-1']
    Click Element    //ba-query-menu[@class='sitelist_NAVlist']//div/label[@for='p体育-1']
    Wait Until Page Contains Element    //ba-query-menu[@class='sitelist_NAVlist']//label[@for='体育-3Sing-13']/label
    Click Element    //ba-query-menu[@class='sitelist_NAVlist']//label[@for='体育-3Sing-13']/label
    Wait Until Page Contains Element    //div[@class='bamenu_btn_area']/button[2]
    Click Element    //div[@class='bamenu_btn_area']/button[2]
    Sleep    2s
    Page Should Contain Element    //div[@id='hottestInfoTable']//div[@class='card-header clearfix hotdata_bgcolor'][contains(.,'体育')]
    ${valueB}=  Get Text     //div[@id='hottestInfoTable']//tbody/tr[1]/td[2]
    ${result}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    Check the time if choose game 
    
Search In Classification
    Reload Page
    Sleep    5s 
    # 全部娛樂城
    ${valueA}=  Get Text     //div[@id='hottestInfoTable']//tbody/tr[1]/td[2]
    Wait Until Page Contains Element    //div[@class='mobile_btn_area_pos show_991']/div/button[contains(.,'游戏选单')]
    Click Element    //div[@class='mobile_btn_area_pos show_991']/div/button[contains(.,'游戏选单')]
    Sleep    2s
    Click Element    //div[@class='drop-panel']/div/a[contains(.,'娱乐城查询')]
    Click Element    //div[@class='bamenu_btn_area']/button[1]
    Wait Until Page Contains Element    //div[@class='bamenu_btn_area']/button[2]
    Click Element    //div[@class='bamenu_btn_area']/button[2]
    Sleep    2s
    Page Should Contain Element    //div[@id='gameListTable']//thead/tr/th[1][contains(.,'娱乐城')]
    ${valueB}=  Get Text     //div[@id='hottestInfoTable']//tbody/tr[1]/td[2]
    ${result}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    Check the time if choose game 
    Reload Page
    Sleep   5s
    # 單一娛樂城 3Sing
    Wait Until Page Contains Element    //div[@class='mobile_btn_area_pos show_991']/div/button[contains(.,'游戏选单')]
    Click Element    //div[@class='mobile_btn_area_pos show_991']/div/button[contains(.,'游戏选单')]
    Sleep    2s
    Click Element    //div[@class='drop-panel']/div/a[contains(.,'娱乐城查询')]
    Click Element    //label[@for='p3Sing-13']/div
    Click Element    //div[@class='bamenu_btn_area']/button[2]
    Sleep    2s
    Page Should Contain Element    //div[@id='gameListTable']//tbody/tr/td[1][contains(.,'3Sing')]
    ${valueB}=  Get Text     //div[@id='hottestInfoTable']//tbody/tr[1]/td[2]
    ${result}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    Check the time if choose game

Search In Game
    Wait Until Page Contains Element    //div[@class='mobile_btn_area_pos show_991']/div/button[contains(.,'游戏选单')]
    Click Element    //div[@class='mobile_btn_area_pos show_991']/div/button[contains(.,'游戏选单')]
    Sleep    2s
    Wait Until Page Contains Element    //div[@class='drop-panel']/div/a[contains(.,'游戏查询')]
    Click Element    //div[@class='drop-panel']/div/a[contains(.,'游戏查询')]
    Input Text    //app-game-select-tab/div/div/input    劈鱼来了
    Sleep    2s
    Wait Until Page Contains Element    //button[@id='ngb-typeahead-0-0']
    Click Element    //button[@id='ngb-typeahead-0-0']
    Wait Until Page Contains Element    //app-game-select-tab//div[@class='game-search-panel']//button[@class='btn btn-primary']
    Click Element    //app-game-select-tab//div[@class='game-search-panel']//button[@class='btn btn-primary']
    Sleep    4s
    Capture Page Screenshot
    Check the time if choose game 
    
*** Keywords ***
SuiteSetup
    # 手機板
    ${devname}    Create Dictionary  deviceName=iPhone X
    ${mobile_emulation}    Create Dictionary    mobileEmulation=${devname}
    ${chromeoptions}    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()     sys, selenium.webdriver.chrome.options
    ${chromeoptions_experimental_options}    Set Variable    ${mobile_emulation}
    Call Method    ${chromeoptions}    add_experimental_option     mobileEmulation     ${devname}
    Create WebDriver    Chrome    chrome_options=${chromeoptions}    
    Go To    https://ppap.pmzoe.com/login

    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    
SuiteTeardown
    Run Keyword If Any Tests Failed    Capture Page Screenshot 
    Close Browser
