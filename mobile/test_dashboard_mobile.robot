*** Settings ***
Force Tags    Login
Suite Setup    SuiteSetup
Suite Teardown    SuiteTeardown
Resource    ../lib/resource.robot
Resource    ../keyword/keyword_common.robot
Resource    ../keyword/keyword_dashboard_mobile.robot

*** Test Cases ***
Check login
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
   
Check sidebar link Dashboard navigation is correct
    # 關掉公告訊息提示
    Sleep    5s
    Wait Until Page Contains Element    //div[@class='container bg-white boss-know-panel']//button[1]
    Click Element  //div[@class='container bg-white boss-know-panel']//button[1]
    Sleep    3s
    Wait Until Page Contains Element    //a[@class='collapse-menu-link ion-navicon']
    Click Element    //a[@class='collapse-menu-link ion-navicon']
    Click Sidebar Link    运营看板
    Click Topbar Link     站台列表
    Click Topbar Link     游戏解析
    No Operation

Click Search
    Set Browser Implicit Wait    5s
    Click Topbar Link    运营看板
    Sleep  2s

    Quick Search In Mobile    昨日
    Check Chart In Four card
    Execute JavaScript  window.document.documentElement.scrollTop = 0;
    Count In Seven Days For yesterday Mobile
    
    Quick Search In Mobile    本周
    Execute JavaScript  window.document.documentElement.scrollTop = 0;
    Check Chart In Four card
    Execute JavaScript  window.document.documentElement.scrollTop = 0;
    Count In A Day For week Mobile

    Quick Search In Mobile    上周
    Execute JavaScript  window.document.documentElement.scrollTop = 0;
   Check Chart In Four card
    Execute JavaScript  window.document.documentElement.scrollTop = 0;
    Count In A Day For week Mobile
    
Click Search In Year
    Reload Page
    Sleep    10s
    @{seasons}  Set Variable  本年  去年  本季  上季
    :FOR  ${season}  IN  @{seasons}
    \  Quick Search For Year And Season In Mobile    ${season}
    \  Execute JavaScript  window.document.documentElement.scrollTop = 0;
    \  Check Chart In Four card
    \  Execute JavaScript  window.document.documentElement.scrollTop = 0;
    \  Count In A Day For months Mobile
    \  Click Link    //div[@class='baDateform btn-group']/a[contains(.,'昨日')] 


    @{years}  Set Variable  本月  上月
    :FOR  ${year}  IN  @{years}
    \  Quick Search In Mobile    ${year}
    \  Execute JavaScript  window.document.documentElement.scrollTop = 0;
    \  Check Chart In Four card
    \  Execute JavaScript  window.document.documentElement.scrollTop = 0;
    \  Count In A Day For months Mobile

Check Trend Is Active
# 損益/有效損益/投注單量/ 活耀會員  排行
    Reload Page
    Sleep    10s
    Execute JavaScript  window.document.documentElement.scrollTop = 0;
    # 排行裡單一站台的趨勢圖(上周的4張卡片)
    Wait Until Element Is Visible   //div[@class="baDateform btn-group"]/a[contains(.,'上周')]  
    Click Link    //div[@class="baDateform btn-group"]/a[contains(.,'上周')] 

    Sleep  3s
    Page Should Contain Element    //div[@id='payoffSums']
    Click Element  //div[@id='payoffSums']
    Wait Until Page Contains Element   //ba-card[@class="dashboss_chart payoffSums"]//div/a[contains(.,'排行')]
    Sleep  20s
    Click Element  //ba-card[@class="dashboss_chart payoffSums"]//div/a[contains(.,'排行')]

    @{rows}  Set Variable  2  3  4  
    :FOR  ${row}  IN  @{rows}
    \  Wait Until Page Contains Element  //ba-card[@class="dashboss_chart payoffSums"]//tbody/tr[${row}]/td[3]/div/small
    \  Click Element  //ba-card[@class="dashboss_chart payoffSums"]//tbody/tr[${row}]/td[3]/div/small
    \  Sleep  5s
    \  Wait Until Page Contains Element  //div[@class='container bg-white test']//canvas
    \  Mouse Over  //div[@class='container bg-white test']//canvas
    \  Capture Page Screenshot
    \  Click Element  //div[@class="container bg-white test"]/div/i
    \  Sleep  3s

    Execute JavaScript  window.document.documentElement.scrollTop = 0;
    Click Element  //div[@id='payoffSums']
    Click Element  //div[@id='commissionableSums']
    Wait Until Page Contains Element  //ba-card[@class="dashboss_chart commissionableSums"]//div/a[contains(.,'排行')]

    Click Element  //ba-card[@class="dashboss_chart commissionableSums"]//div/a[contains(.,'排行')]
    @{rows}  Set Variable  2  3  4  
    :FOR  ${row}  IN  @{rows}
    \  Click Element  //ba-card[@class="dashboss_chart commissionableSums"]//tbody/tr[${row}]/td[3]/div/small
    \  Sleep  5s
    \  Wait Until Page Contains Element  //div[@class='container bg-white test']//canvas
    \  Mouse Over  //div[@class='container bg-white test']//canvas
    \  Capture Page Screenshot
    \  Click Element  //div[@class="container bg-white test"]/div/i
    \  Sleep  3s

    Execute JavaScript  window.document.documentElement.scrollTop = 0;
    Click Element  //div[@id='commissionableSums']
    Click Element  //div[@id='wagersCounts']

    Click Element  //ba-card[@class="dashboss_chart wagersCounts"]//div/a[contains(.,'排行')]
    @{rows}  Set Variable  2  3  4 
    :FOR  ${row}  IN  @{rows}
    \  Click Element  //ba-card[@class="dashboss_chart wagersCounts"]//tbody/tr[${row}]/td[3]/div/small
    \  Sleep  5s
    \  Wait Until Page Contains Element  //div[@class='container bg-white test']//canvas
    \  Mouse Over  //div[@class='container bg-white test']//canvas
    \  Capture Page Screenshot
    \  Click Element  //div[@class="container bg-white test"]/div/i
    \  Sleep  3s

    Execute JavaScript  window.document.documentElement.scrollTop = 0;
    Click Element  //div[@id='wagersCounts']
    Click Element  //div[@id='memberCounts']

    Click Element  //ba-card[@class="dashboss_chart memberCounts"]//div/a[contains(.,'排行')]
    @{rows}  Set Variable  2  3  4 
    :FOR  ${row}  IN  @{rows}
    \  Click Element  //ba-card[@class="dashboss_chart memberCounts"]//tbody/tr[${row}]/td[3]/div/small
    \  Sleep  5s
    \  Wait Until Page Contains Element  //div[@class='container bg-white test']//canvas
    \  Mouse Over  //div[@class='container bg-white test']//canvas
    \  Capture Page Screenshot
    \  Click Element  //div[@class="container bg-white test"]/div/i
    \  Sleep  3s

Search In Datetime 
    Reload Page
    Sleep    10s
    Execute JavaScript  window.document.documentElement.scrollTop = 0;
    @{mounths}    Set Variable    0: 2019年3月  1: 2019年2月  2: 2019年1月  3: 2018年12月  4: 2018年11月  5: 2018年10月  6: 2018年9月  7: 2018年8月  
    :FOR    ${month}  IN  @{mounths}
    \  Search In Mounth For Mobile    ${month}
    \  Check Chart In Four card
    \  Execute JavaScript  window.document.documentElement.scrollTop = 0;

Check Five Chart Is Synchronize
    Reload Page
    Sleep    5s
    @{chartValues}    Set Variable  有效投注  投注单量  营收比  损益  游戏人次
    :FOR  ${chartValue}  IN  @{chartValues}
    \  Execute JavaScript    window.document.documentElement.scrollTop = 350;
    \  Wait Until Page Contains Element  //div[@class='selectBarLine']/a[contains(.,'${chartValue}')]
    \  Click Element    //div[@class='selectBarLine']/a[contains(.,'${chartValue}')]
    \  Sleep    3s
    \  Capture Page Screenshot
    \  Execute JavaScript    window.document.documentElement.scrollTop = 500;
    \  ${result}=    Run Keyword And Return Status    Page Should Contain Element    //div[@id='tableData']/table/thead/tr/td[4][contains(.,'${chartValue}')]
    \  Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation   

    Wait Until Page Contains Element    //div[@class='game-cityrank-panel']/div/div/span
    Click Element    //div[@class='game-cityrank-panel']/div/div/span
    Wait Until Page Contains Element    //div[@class='add-field-item']/label[@for='a1'][contains(.,'有效投注')]
    Click Element    //div[@class='add-field-item']/label[@for='a1'][contains(.,'有效投注')]
    Click Element    //div[@class='add-field-item']/label[@for='a2'][contains(.,'投注单量')]
    Sleep    2s
    Click Element    //div[@class='game-cityrank-panel']/div/div/span
    Capture Page Screenshot

Check Five Chart In Category   
    Sleep    5s
    @{className}  Set Variable       体育    视讯    机率    彩票    捕鱼    棋牌
    :FOR  ${name}  IN  @{className}
    \  Wait Until Page Contains Element    //div[@class='mobile_btn_area_pos']/div/button[contains(.,'游戏选单')]
    \  Click Element    //div[@class='mobile_btn_area_pos']/div/button[contains(.,'游戏选单')]
    \  Sleep    2s
    \  Wait Until Page Contains Element   //div[@class='accordion']//label[contains(.,'${name}')]/div
    \  Click Element    //div[@class='accordion']//label[contains(.,'${name}')]/div
    \  Click Element    //div[@class='bamenu_btn_area']/button[contains(.,' 查询 ')]
    \  Execute JavaScript    window.document.documentElement.scrollTop = 500;
    \  Sleep    2s
    \  ${result}=    Run Keyword And Return Status    Page Should Contain Element    //div[@class='card-header clearfix']/h3[contains(.,'${name}')]
    \  Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    NO Operation
    \  Execute JavaScript    window.document.documentElement.scrollTop = 430;

Check Five Chart In Classification  
       Wait Until Page Contains Element    //div[@class='mobile_btn_area_pos']/div/button[contains(.,'游戏选单')]
       Click Element    //div[@class='mobile_btn_area_pos']/div/button[contains(.,'游戏选单')]
       Sleep    2s
       Click Element    //div[@class='text-center mobile_btn_area2']/a[contains(.,'娱乐城查询')]
       Click Element    //div[@class='bamenu_btn_area']/button[contains(.,' 查询 ')]
       Sleep    2s
       Page Should Contain Element    //div[@class='card-header clearfix']/h3[contains(.,'娱乐城')]
       Execute JavaScript    window.document.documentElement.scrollTop = 560;
       Capture Page Screenshot

       Execute JavaScript    window.document.documentElement.scrollTop = 430;
       Click Element    //div[@class='mobile_btn_area_pos']/div/button[contains(.,'游戏选单')]
       Sleep    2s
       Sleep    2s
       Wait Until Page Contains Element   //div[@class='accordion']//label[contains(.,'3Sing')]/div
       Click Element    //div[@class='accordion']//label[contains(.,'3Sing')]/div
       Click Element    //div[@class='bamenu_btn_area']/button[contains(.,' 查询 ')]
       Execute JavaScript    window.document.documentElement.scrollTop = 500;
       Sleep    2s
       ${result}=    Run Keyword And Return Status    Page Should Contain Element    //div[@class='card-header clearfix']/h3[contains(.,'3Sing')]
       Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    NO Operation



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
