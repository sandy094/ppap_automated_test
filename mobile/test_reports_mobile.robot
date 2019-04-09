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
    # Sleep  10s
    # # 關掉公告訊息提示
    Wait Until Page Contains Element    //div[@class='container bg-white boss-know-panel']//button[1]
    Click Element  //div[@class='container bg-white boss-know-panel']//button[1]
    Sleep  3s
    Wait Until Page Contains Element    //a[@class='collapse-menu-link ion-navicon']
    Click Element    //a[@class='collapse-menu-link ion-navicon']
    Check Operational Information Link    报表呈现

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
    @{months}    Set Variable    0: 2019年1月  1: 2018年12月  2: 2018年11月  3: 2018年10月  4: 2018年9月  5: 2018年8月  6: 2018年7月  7: 2018年6月  8: 2018年5月  9: 2018年4月  10: 2018年3月  11: 2018年2月  12: 2018年1月
    :FOR  ${month}  IN  @{months}
    \  Sleep  10s
    \  Search In Mounth For Mobile    ${month}
    \  Sleep  15s
    \  ${CheckValueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
    \  Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  ${CheckValueA}=  Set Variable  ${CheckValueB}

# Search In Category
#     Reload Page  
#     Sleep    5s 
#     Wait Until Page Contains Element    //div[@class='mobile_btn_area_pos show_991']/div/button[contains(.,'游戏选单')]
#     Click Element    //div[@class='mobile_btn_area_pos show_991']/div/button[contains(.,'游戏选单')]
#     Sleep    2s
#     Wait Until Page Contains Element    //div[@class='bamenu_btn_area']/button[1]
#     Click Element    //div[@class='bamenu_btn_area']/button[1]
#     Sleep    2s
#     Wait Until Page Contains Element    //ba-query-menu[@class='sitelist_NAVlist']//div[@class='checkI']/label[@for='体育-1']
#     Click Element    //ba-query-menu[@class='sitelist_NAVlist']//div[@class='checkI']/label[@for='体育-1']
#     Wait Until Page Contains Element    //ba-query-menu[@class='sitelist_NAVlist']//label[@for='体育-3Sing-13']/label
#     Click Element    //ba-query-menu[@class='sitelist_NAVlist']//label[@for='体育-3Sing-13']/label
#     Wait Until Page Contains Element    //div[@class='bamenu_btn_area']/button[2]
#     Click Element    //div[@class='bamenu_btn_area']/button[2]
#     Sleep    2s
#     Page Should Contain Element    //div[@id='hottestInfoTable']//div[@class='card-header clearfix'][contains(.,'体育')]
#     Capture Page Screenshot
    
*** Keywords ***
SuiteSetup
    # 手機板
    ${devname}    Create Dictionary  deviceName=iPhone X
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
    Run Keyword If Test Failed    Capture Page Screenshot
    Close Browser
