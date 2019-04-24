*** Settings ***
Force Tags    Login
Suite Setup    SuiteSetup
Suite Teardown    SuiteTeardown
Resource    ../lib/resource.robot
Resource    ../keyword/keyword_common.robot
Resource    ../keyword/keyword_save_dashboard_mobile.robot

*** Test Cases ***
Check login
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}

Check sidebar link Dashboard navigation is correct
    # 關掉公告訊息提示
    Sleep    5s
    Wait Until Page Contains Element    //div[@class='container bg-white boss-know-panel']//button[1]
    Click Element    //div[@class='container bg-white boss-know-panel']//button[1]
    Sleep    10s
    Wait Until Page Contains Element    //a[@class='collapse-menu-link ion-navicon']
    Click Element    //a[@class='collapse-menu-link ion-navicon']
    Click Sidebar Link    运营看板
    Sleep    10s
    Click Element    //div[@class='card-body card-box']/div/div/a[contains(.,'运营看板')]
    Wait Until Page Contains Element    //div[@class='card-body card-box']/div/div/a/div[contains(.,'存提资讯')] 
    Click Element    //div[@class='card-body card-box']/div/div/a/div[contains(.,'存提资讯')] 
   
Click Search
    Set Browser Implicit Wait    10s
    # Click Element  //div[@class='modal-content']//div/i
    # Click Element  //div[@class='loader-panel load-xs-go p-2']/i

    # 昨日都是0暫不測
    # Quick Search In Mobile    昨日
    # Execute JavaScript  window.document.documentElement.scrollTop = 0;
    # Check Chart In Four card
    # Execute JavaScript  window.document.documentElement.scrollTop = 0;
    # Count In Seven Days For yesterday Mobile

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
    
    @{years}  Set Variable  本月  上月
    :FOR  ${year}  IN  @{years}
    \  Quick Search In Mobile    ${year}
    \  Execute JavaScript  window.document.documentElement.scrollTop = 0;
    \  Check Chart In Four card
    \  Execute JavaScript  window.document.documentElement.scrollTop = 0;
    \  Count In A Day For months Mobile
    \  Execute JavaScript  window.document.documentElement.scrollTop = 0;

    @{seasons}  Set Variable  本年  去年  本季  上季
    :FOR  ${season}  IN  @{seasons}
    \  Quick Search For Year And Season In Mobile    ${season}
    \  Execute JavaScript  window.document.documentElement.scrollTop = 0;
    \  Check Chart In Four card
    \  Execute JavaScript  window.document.documentElement.scrollTop = 0;
    \  Count In A Day For months Mobile
    \  Execute JavaScript  window.document.documentElement.scrollTop = 0;

Check Trend
    # 排行裡單一站台的趨勢圖(本周的4張卡片)
    Wait Until Page Contains Element   //div[@class='baDateform btn-group']/a[contains(.,'上周')]  
    Click Link    //div[@class='baDateform btn-group']/a[contains(.,'上周')]

    Execute JavaScript  window.document.documentElement.scrollTop = 0;
    Sleep    5s
    # 存提差額
    Wait Until Page Contains Element    //div[@id='differenceAmount']
    Click Element    //div[@id='differenceAmount']
    Wait Until Page Contains Element    //ba-card[@id='differenceAmountContent']//div/a[contains(.,'排行')]
    Click Element   //ba-card[@id='differenceAmountContent']//div/a[contains(.,'排行')]
    @{rows}  Set Variable  2  3  4  5  6 
    :FOR  ${row}  IN  @{rows}
    \  Wait Until Page Contains Element  //ba-card[@id='differenceAmountContent']//tbody/tr[${row}]/td[3]/div/small
    \  Click Element  //ba-card[@id='differenceAmountContent']//tbody/tr[${row}]/td[3]/div/small
    \  Sleep  2s
    \  Wait Until Page Contains Element  //div[@class='container bg-white test']//canvas
    \  Mouse Over  //div[@class='container bg-white test']//canvas
    \  Sleep  2s
    \  Capture Page Screenshot
    \  Click Element  //div[@class="container bg-white test"]/div/i
    # 取款總額
    Sleep    5s
    Wait Until Page Contains Element    //div[@id='withdrawAmount'] 
    Click Element    //div[@id='withdrawAmount']    
    Click Element    //ba-card[@id='withdrawAmountContent']//div/a[contains(.,'排行')]
    @{rows}  Set Variable  2  3  4  5  6  
    :FOR  ${row}  IN  @{rows}
    \  Click Element  //ba-card[@id='withdrawAmountContent']//tbody/tr[${row}]/td[3]/div/small
    \  Sleep  2s
    \  Wait Until Page Contains Element  //div[@class='container bg-white test']//canvas
    \  Mouse Over  //div[@class='container bg-white test']//canvas
    \  Sleep  2s
    \  Capture Page Screenshot
    \  Click Element  //div[@class="container bg-white test"]/div/i
    # 存款總額
    Page Should Contain Element    //div[@id='depositAmount']
    Click Element  //div[@id='depositAmount']
    Wait Until Page Contains Element    //ba-card[@id='depositAmountContent']//div/a[contains(.,'排行')]
    Click Element  //ba-card[@id='depositAmountContent']//div/a[contains(.,'排行')]
    @{rows}  Set Variable  2  3  4  5  6 
    :FOR  ${row}  IN  @{rows}
    \  Click Element  //ba-card[@id='depositAmountContent']//tbody/tr[${row}]/td[3]/div/small
    \  Sleep  2s
    \  Wait Until Page Contains Element  //div[@class='container bg-white test']//canvas
    \  Mouse Over  //div[@class='container bg-white test']//canvas
    \  Capture Page Screenshot
    \  Click Element  //div[@class="container bg-white test"]/div/i
    # 首存總額
    Page Should Contain Element    //div[@id='firstDepositAmount']
    Click Element  //div[@id='firstDepositAmount']
    Wait Until Page Contains Element    //ba-card[@id='firstDepositAmountContent']//div/a[contains(.,'排行')]
    Click Element  //ba-card[@id='firstDepositAmountContent']//div/a[contains(.,'排行')]
    @{rows}  Set Variable  2  3  4  5  6  
    :FOR  ${row}  IN  @{rows}
    \  Click Element  //ba-card[@id='firstDepositAmountContent']//tbody/tr[${row}]/td[3]/div/small
    \  Sleep  2s
    \  Wait Until Page Contains Element  //div[@class='container bg-white test']//canvas
    \  Mouse Over  //div[@class='container bg-white test']//canvas
    \  Capture Page Screenshot
    \  Click Element  //div[@class="container bg-white test"]/div/i

Search In Datetime 
    Execute JavaScript  window.document.documentElement.scrollTop = 0;
    Sleep    10s
    @{mounths}    Set Variable    0: 2019年4月  1: 2019年3月  2: 2019年2月  3: 2019年1月
    :FOR    ${month}  IN  @{mounths}
    \  Search In Mounth For Mobile    ${month}

Check Chart  
    Sleep    2s
    Wait Until Page Contains Element    //div[@class='baDateform btn-group']/a[contains(.,'昨日')]   
    Click Element    //div[@class='baDateform btn-group']/a[contains(.,'昨日')] 
    Execute JavaScript    window.scrollTo(200, document.body.scrollHeight)
    Execute JavaScript  window.scrollTo(100, document.body.scrollHeight)
    Wait Until Page Contains Element  //div[@id='deposit-chart']/div//canvas
    Page Should Contain Element  //div[@id='deposit-chart']/div//canvas
    Sleep    2s
    Mouse Over  //div[@id='deposit-chart']/div//canvas
    Capture Page Screenshot

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
