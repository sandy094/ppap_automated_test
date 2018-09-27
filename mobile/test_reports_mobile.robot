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
    Sleep  5s
    # 關掉公告訊息提示
    Wait Until Page Contains Element    //div[@class='container bg-white boss-know-panel']//button[1]
    Click Element  //div[@class='container bg-white boss-know-panel']//button[1]
    Wait Until Page Contains Element  //a[@class='collapse-menu-link ion-navicon']
    Click Element  //a[@class='collapse-menu-link ion-navicon']
    Check Operational Information Link    报表呈现

Click Search
    Sleep    10s
    Wait Until Page contains Element  //div[@class="baDateform btn-group"]/a[contains(.,'今日')]
    Click Element    //div[@class="baDateform btn-group"]/a[contains(.,'今日')]
    Sleep    10s
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
    \  ${CheckValueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
    \  Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  ${CheckValueA}=  Set Variable  ${CheckValueB}
    \  Quick Search botton In Mobile    本周

Search In Datetime 
    ${CheckValueA}=  Get Text  //table[@id="TrendInfoTable"]//tbody/tr[1]/td[2]
    @{mounths}    Set Variable    0: 2018年9月  1: 2018年8月  2: 2018年7月  3: 2018年6月  4: 2018年5月  5: 2018年4月  6: 2018年3月  7: 2018年2月  8: 2018年1月  9: 2017年12月  10: 2017年11月  11: 2017年10月  12: 2017年9月
    :FOR    ${month}  IN  @{mounths}
    \  Sleep  10s
    \  Search In Mounth For Mobile    ${month}
    \  Sleep  15s
    \  ${CheckValueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
    \  Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  ${CheckValueA}=  Set Variable  ${CheckValueB}

    Capture Page Screenshot
*** Keywords ***
SuiteSetup
    # 手機板
    ${devname}    Create Dictionary  deviceName=iPhone 6/7/8 Plus
    ${mobile_emulation}    Create Dictionary    mobileEmulation=${devname}
    ${chromeoptions}    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()     sys, selenium.webdriver.chrome.options
    ${chromeoptions_experimental_options}    Set Variable    ${mobile_emulation}
    Call Method    ${chromeoptions}    add_experimental_option     mobileEmulation     ${devname}
    Create WebDriver    Chrome    chrome_options=${chromeoptions}    
    Go To    http://ppap.pmzoe.com/login

    # Open Browser    ${LOGIN URL}    ${BROWSER}
    # Set Window Size    414    736
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    
SuiteTeardown
    Close Browser
