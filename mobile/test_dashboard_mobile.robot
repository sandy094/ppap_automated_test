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
    Wait Until Page Contains Element    //div[@class='container bg-white boss-know-panel']//button[1]
    Click Element  //div[@class='container bg-white boss-know-panel']//button[1]
    # Click Element  //div[@class='loader-panel load-xs-go p-2']/i
    Sleep    5s
    Wait Until Page Contains Element    //a[@class='collapse-menu-link ion-navicon']
    Click Element    //a[@class='collapse-menu-link ion-navicon']
    Click Sidebar Link    运营看板
    Click Topbar Link     站台列表
    Click Topbar Link     游戏占比
    No Operation

Click Search
    Set Browser Implicit Wait    5s
    # Click Element  //div[@class='modal-content']//div/i
    
    Click Topbar Link    运营看板
    Sleep  2s

    # Quick Search In Mobile    昨日
    # Check Chart In Four card
    # Execute JavaScript  window.document.documentElement.scrollTop = 0;
    # Count In Seven Days For yesterday Mobile
    
    # Quick Search In Mobile    本周
    # Check Chart In Four card
    # Execute JavaScript  window.document.documentElement.scrollTop = 0;
    # Count In A Day For week Mobile

    # Quick Search In Mobile    上周
    # Check Chart In Four card
    # Execute JavaScript  window.document.documentElement.scrollTop = 0;
    # Count In A Day For week Mobile
    
# Click Search In Year
    # Reload Page
    # Sleep    10s
    # @{seasons}  Set Variable  本年  去年  本季  上季
    # :FOR  ${season}  IN  @{seasons}
    # \  Quick Search For Year And Season In Mobile    ${season}
    # \  Check Chart In Four card
    # \  Execute JavaScript  window.document.documentElement.scrollTop = 0;
    # \  Count In A Day For months Mobile
    # \  Click Link    //div[@class='baDateform btn-group']/a[contains(.,'昨日')] 


    # @{years}  Set Variable  本月  上月
    # :FOR  ${year}  IN  @{years}
    # \  Quick Search In Mobile    ${year}
    # \  Check Chart In Four card
    # \  Execute JavaScript  window.document.documentElement.scrollTop = 0;
    # \  Count In A Day For months Mobile

# Check Trend Is Active
#     # Reload Page
#     Sleep    10s
#     Execute JavaScript  window.document.documentElement.scrollTo = 0;
#     # 排行裡單一站台的趨勢圖(上周的4張卡片)
#     Wait Until Element Is Visible   //div[@class="baDateform btn-group"]/a[contains(.,'上周')]  
#     Click Link    //div[@class="baDateform btn-group"]/a[contains(.,'上周')] 

#     Sleep  3s
#     Page Should Contain Element    //div[@id='payoffSums']
#     Click Element  //div[@id='payoffSums']
#     Wait Until Page Contains Element   //ba-card[@class="dashboss_chart payoffSums"]//div/a[contains(.,'排行')]
#     Sleep  5s
#     Click Element  //ba-card[@class="dashboss_chart payoffSums"]//div/a[contains(.,'排行')]

#     @{rows}  Set Variable  2  3  4  5  6  7  8  9  10  11 
#     :FOR  ${row}  IN  @{rows}
#     \  Wait Until Page Contains Element  //ba-card[@class="dashboss_chart payoffSums"]//tbody/tr[${row}]/td[3]/div/small
#     \  Click Element  //ba-card[@class="dashboss_chart payoffSums"]//tbody/tr[${row}]/td[3]/div/small
#     \  Sleep  5s
#     \  Wait Until Page Contains Element  //div[@class='container bg-white test']//canvas
#     \  Mouse Over  //div[@class='container bg-white test']//canvas
#     \  Capture Page Screenshot
#     \  Click Element  //div[@class="container bg-white test"]/div/i
#     \  Sleep  3s

#     Click Element  //ba-card[@class="dashboss_chart commissionableSums"]//div/a[contains(.,'排行')]
#     @{rows}  Set Variable  2  3  4  5  6  7  8  9  10  11 
#     :FOR  ${row}  IN  @{rows}
#     \  Click Element  //ba-card[@class="dashboss_chart commissionableSums"]//tbody/tr[${row}]/td[3]/div/small
#     \  Sleep  5s
#     \  Wait Until Page Contains Element  //div[@class='container bg-white test']//canvas
#     \  Mouse Over  //div[@class='container bg-white test']//canvas
#     \  Capture Page Screenshot
#     \  Click Element  //div[@class="container bg-white test"]/div/i
#     \  Sleep  3s

#     Click Element  //ba-card[@class="dashboss_chart wagersCounts"]//div/a[contains(.,'排行')]
#     @{rows}  Set Variable  2  3  4  5  6  7  8  9  10  11 
#     :FOR  ${row}  IN  @{rows}
#     \  Click Element  //ba-card[@class="dashboss_chart wagersCounts"]//tbody/tr[${row}]/td[3]/div/small
#     \  Sleep  5s
#     \  Wait Until Page Contains Element  //div[@class='container bg-white test']//canvas
#     \  Mouse Over  //div[@class='container bg-white test']//canvas
#     \  Capture Page Screenshot
#     \  Click Element  //div[@class="container bg-white test"]/div/i
#     \  Sleep  3s

#     Click Element  //ba-card[@class="dashboss_chart memberCounts"]//div/a[contains(.,'排行')]
#     @{rows}  Set Variable  2  3  4  5  6  7  8  9  10  11 
#     :FOR  ${row}  IN  @{rows}
#     \  Click Element  //ba-card[@class="dashboss_chart memberCounts"]//tbody/tr[${row}]/td[3]/div/small
#     \  Sleep  5s
#     \  Wait Until Page Contains Element  //div[@class='container bg-white test']//canvas
#     \  Mouse Over  //div[@class='container bg-white test']//canvas
#     \  Capture Page Screenshot
#     \  Click Element  //div[@class="container bg-white test"]/div/i
#     \  Sleep  3s

# Search In Datetime 
#     Reload Page
#     Sleep    10s
#     @{mounths}    Set Variable    0: 2018年9月  1: 2018年8月  2: 2018年7月  3: 2018年6月  4: 2018年5月  5: 2018年4月  6: 2018年3月  7: 2018年2月  8: 2018年1月  9: 2017年12月  10: 2017年11月  11: 2017年10月  12: 2017年9月
#     :FOR    ${month}  IN  @{mounths}
#     \  Search In Mounth For Mobile    ${month}
#     \  Check Chart In Four card
#     \  Execute JavaScript  window.document.documentElement.scrollTop = 0;

Check All Chart Is Active
    Reload Page
    Sleep    20s
    Execute JavaScript    window.scrollTo(200, document.body.scrollHeight)
    Check Chart In Game Classification    种类
    Check Chart In Game Station    娱乐城

# Check Single Chart
#     # 細項點掉單一圖表
#     Sleep    20s
#     Click Element    //div[@class='row hidden_991']/div/div/div/button[contains(.,'种类')]
#     Execute JavaScript    window.scrollTo(200, document.body.scrollHeight)
#     Sleep    10s
#     Wait Until Page Contains Element  //table[@class='table dataTable']/tbody/tr[1]/td[1]
#     Click element  //table[@class='table dataTable']/tbody/tr[1]/td[1]
#     Sleep    20s
#     Wait Until Page Contains Element  //table[@class='table table-hover']/tbody/tr[1]/td[1]/div
#     Click Element  //table[@class='table table-hover']/tbody/tr[1]/td[1]/div
#     Sleep  10s
#     Capture Page Screenshot
    
#     # 以日合計
#     Click Element  //div[@class="text-left mt-4"]//div/div/button
#     Wait Until Page Contains Element  //div[@class="text-left mt-4"]//div/div/ul/li/a[contains(.,'以时合计')]
#     Click Element  //div[@class="text-left mt-4"]//div/div/ul/li/a[contains(.,'以日合计')]
#     Sleep  5s
#     Capture Page Screenshot


*** Keywords ***
SuiteSetup
    ${devname}    Create Dictionary  deviceName=iPhone 6/7/8 Plus
    ${mobile_emulation}    Create Dictionary    mobileEmulation=${devname}
    ${chromeoptions}    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()     sys, selenium.webdriver.chrome.options
    ${chromeoptions_experimental_options}    Set Variable    ${mobile_emulation}
    Call Method    ${chromeoptions}    add_experimental_option     mobileEmulation     ${devname}
    Create WebDriver    Chrome    chrome_options=${chromeoptions}    
    Go To    http://ppap.pmzoe.com/login
    # Open Browser    ${LOGIN URL}    ${BROWSER}
    # Set Window Size    414    736
    
    # ${device metrics}=   Create Dictionary    width=${414}     height=${736}    pixelRatio=${3.0}    userAgent=Mozilla/5.0 (Linux; Android 7.0; SM-G930V Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36
    # ${mobile emulation}=    Create Dictionary    deviceMetrics=${device metrics}
    # ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys,selenium.webdriver
    # Call Method    ${chrome options}    add_experimental_option    mobileEmulation   ${mobile emulation}
    # Create Webdriver    Chrome    chrome_options=${chrome options}
    # Go To    http://ppap.pmzoe.com/login
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    
SuiteTeardown
    Run Keyword If Any Tests Failed    Capture Page Screenshot 
    Close Browser
