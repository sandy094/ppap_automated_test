*** Settings ***
Force Tags    Login
Suite Setup    SuiteSetup
Suite Teardown    SuiteTeardown
Resource    ../lib/resource.robot
Resource    ../keyword/keyword_common.robot
Resource    ../keyword/keyword_dashboard.robot

*** Test Cases ***
Check login
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
   
Check sidebar link Dashboard navigation is correct
    # 關掉公告訊息提示
    # Wait Until Page Contains Element    //div[@class='container bg-white boss-know-panel']//button[1]
    # Click Element  //div[@class='container bg-white boss-know-panel']//button[1]
    # Click Element  //div[@class='loader-panel load-xs-go p-2']/i
    Set Browser Implicit Wait    20s
    Click Sidebar Link    运营看板
    Click Topbar Link     站台列表
    Click Topbar Link     游戏占比
    No Operation

Click Search
    Set Browser Implicit Wait    10s
    # Click Element  //div[@class='modal-content']//div/i
    
    Check Dashboard Link    运营看板
    Sleep  2s
    # Quick Search botton    今日
    # Check Chart In Four card
    # Count In A Day For Today

    Quick Search botton    昨日
    Check Chart In Four card
    Count In Seven Days For yesterday

    Quick Search botton    本周
    Check Chart In Four card
    Count In A Day For week

    Quick Search botton    上周
    Check Chart In Four card
    Count In A Day For week
Click Search In Year
    @{seasons}  Set Variable  本年  去年  本季  上季
    :FOR  ${season}  IN  @{seasons}
    \  Quick Search In year and season    ${season}
    \  Check Chart In Four card
    \  Count In A Day For months

    @{years}  Set Variable  本月  上月
    :FOR  ${year}  IN  @{years}
    \  Quick Search botton    ${year}
    \  Check Chart In Four card
    \  Count In A Day For months

Check Trend Is Active
    # Reload Page
    Sleep    10s
    # 排行裡單一站台的趨勢圖(上周的4張卡片)
    Wait Until Element Is Visible   //div[@class="baDateform btn-group hidden_991"]/a[contains(.,'上周')]  
    Click Link    //div[@class="baDateform btn-group hidden_991"]/a[contains(.,'上周')] 

    Click Element  //ba-card[@class="dashboss_chart payoffSums"]//div/a[contains(.,'排行')]
    @{rows}  Set Variable  2  3  4  5  6  7  8  9  10  11 
    :FOR  ${row}  IN  @{rows}
    \  Wait Until Page Contains Element  //ba-card[@class="dashboss_chart payoffSums"]//tbody/tr[${row}]/td[3]/div/small
    \  Click Element  //ba-card[@class="dashboss_chart payoffSums"]//tbody/tr[${row}]/td[3]/div/small
    \  Sleep  2s
    \  Wait Until Page Contains Element  //div[@class="col-12"]//div/div/canvas
    \  Capture Page Screenshot
    \  Click Element  //div[@class="container bg-white test"]/div/i

    Click Element  //ba-card[@class="dashboss_chart commissionableSums"]//div/a[contains(.,'排行')]
    @{rows}  Set Variable  2  3  4  5  6  7  8  9  10  11 
    :FOR  ${row}  IN  @{rows}
    \  Click Element  //ba-card[@class="dashboss_chart commissionableSums"]//tbody/tr[${row}]/td[3]/div/small
    \  Sleep  2s
    \  Wait Until Page Contains Element  //div[@class="col-12"]//div/div/canvas
    \  Capture Page Screenshot
    \  Click Element  //div[@class="container bg-white test"]/div/i

    Click Element  //ba-card[@class="dashboss_chart wagersCounts"]//div/a[contains(.,'排行')]
    @{rows}  Set Variable  2  3  4  5  6  7  8  9  10  11 
    :FOR  ${row}  IN  @{rows}
    \  Click Element  //ba-card[@class="dashboss_chart wagersCounts"]//tbody/tr[${row}]/td[3]/div/small
    \  Sleep  2s
    \  Wait Until Page Contains Element  //div[@class="col-12"]//div/div/canvas
    \  Capture Page Screenshot
    \  Click Element  //div[@class="container bg-white test"]/div/i

    Click Element  //ba-card[@class="dashboss_chart memberCounts"]//div/a[contains(.,'排行')]
    @{rows}  Set Variable  2  3  4  5  6  7  8  9  10  11 
    :FOR  ${row}  IN  @{rows}
    \  Click Element  //ba-card[@class="dashboss_chart memberCounts"]//tbody/tr[${row}]/td[3]/div/small
    \  Sleep  2s
    \  Wait Until Page Contains Element  //div[@class="col-12"]//div/div/canvas
    \  Capture Page Screenshot
    \  Click Element  //div[@class="container bg-white test"]/div/i

Search In Datetime 
    Sleep    10s
    @{mounths}    Set Variable    0: 2018年8月  1: 2018年7月  2: 2018年6月  3: 2018年5月  4: 2018年4月  5: 2018年3月  6: 2018年2月  7: 2018年1月  8: 2017年12月  9: 2017年11月  10: 2017年10月  11: 2017年9月  12: 2017年8月
    :FOR    ${month}  IN  @{mounths}
    \  Search In Month    ${month}

    Reload Page
Check All Chart Is Active
    Sleep    20s
    Execute JavaScript    window.scrollTo(200, document.body.scrollHeight)
    Check Chart In Game Classification    种类
    Check Chart In Game Station    娱乐城

Check Single Chart
    # 細項點掉單一圖表
    Sleep    20s
    Click Element    //div[@class='row hidden_991']/div/div/div/button[contains(.,'种类')]
    Execute JavaScript    window.scrollTo(200, document.body.scrollHeight)
    Sleep    10s
    Wait Until Page Contains Element  //table[@class='table dataTable']/tbody/tr[1]/td[1]
    Click element  //table[@class='table dataTable']/tbody/tr[1]/td[1]
    Sleep    20s
    Wait Until Page Contains Element  //table[@class='table table-hover']/tbody/tr[1]/td[1]/div
    Click Element  //table[@class='table table-hover']/tbody/tr[1]/td[1]/div
    Sleep  10s
    Capture Page Screenshot
    
    # 以日合計
    Click Element  //div[@class="text-left mt-4"]//div/div/button
    Wait Until Page Contains Element  //div[@class="text-left mt-4"]//div/div/ul/li/a[contains(.,'以时合计')]
    Click Element  //div[@class="text-left mt-4"]//div/div/ul/li/a[contains(.,'以日合计')]
    Sleep  5s
    Capture Page Screenshot



# Check sidebar link Verifyaccount navigation is correct
    # Check Verifyaccount Information Link    对帐资讯    
    # 娱乐城对帐    站台对帐    对帐设定    抽佣设定    优惠设定    累计查询    站台全站汇出


*** Keywords ***
SuiteSetup
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    
SuiteTeardown
    Run Keyword If Any Tests Failed    Capture Page Screenshot 
    Close Browser
