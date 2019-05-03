*** Settings ***
Force Tags    Login
Suite Setup    SuiteSetup
Suite Teardown    SuiteTeardown
Resource    ../lib/resource.robot
Resource    ../keyword/keyword_common.robot
Resource    ../keyword/keyword_site_comparison_mobile.robot

*** Test Cases ***
Check login
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}

Check sidebar link Game Information navigation is correct
    Close Announcement 
    Set Browser Implicit Wait    10s
    Sleep    3s
    Wait Until Page Contains Element    //a[@class='collapse-menu-link ion-navicon']
    Click Element    //a[@class='collapse-menu-link ion-navicon']
    Click Sidebar Link    站台比较

Search In Condition
    Sleep  10s
    Wait Until Page Contains Element  //div[@class='mobile_btn_area_pos show_991']/div/button
    Click Element    //div[@class='mobile_btn_area_pos show_991']/div/button
    Sleep  5s
    Wait Until Page Contains Element    //div[@id='unselectTable']/table/tbody/tr[1]
    # 選站台篩選
    Click Element    //div[@id='unselectTable']/table/tbody/tr[1] 
    Click Element    //div[@id='unselectTable']/table/tbody/tr[2]
    Sleep   5s
    Click Element    //div[@class='drop-panel']/select-site/div/div/button
    Wait Until Page Contains Element    //div[@class='fast-Apply']/div[2]
    Click Element    //div[@class='fast-Apply']/div[2]   # 選QA測試條件
    Sleep    3s
    Execute JavaScript  window.document.documentElement.scrollTop = 500;
    Wait Until Page Contains Element    //div[@id='conditionSetting']//div/button[contains(.,' 开始比较 ')]
    Click Element    //div[@id='conditionSetting']//div/button[contains(.,' 开始比较 ')]
    Sleep    5s
    Check Search Condition Is correct

# Quick Search Time
#     ${checkValueA}=  Get Text    //table[@id='comparisonArea']/tbody/tr[3]/td[2]
#     ${checkValueC}=  Get Text    //table[@id='comparisonArea']/tbody/tr[3]/td[3]
#     @{days}  Set Variable    上周  本月  上月
#     :FOR  ${day}  IN  @{days}
#     \    Quick Search In Mobile    ${day}
#     \    Verification Value

    # 待改版
    # @{years}  Set Variable    本年  去年  本季  上季
    # :FOR  ${year}  IN  @{years}
    # \    Quick Search For Year And Season In Mobile    ${year}
    # \    Verification Value


    # @{months}  Set Variable    0: 2019年5月  1: 2019年4月 
    # :FOR  ${month}  IN  @{months}
    # \    Search In Mounth For Mobile    ${month}
    # \    Verification Value

Search Another Condition
    # 改變搜尋條件
    Execute JavaScript  window.document.documentElement.scrollTop = 0;
    Sleep    10s
    Wait Until Page Contains Element    //div[@class='site-comparison-panel']/div/div/button
    Click Element    //div[@class='site-comparison-panel']/div/div/button
    Sleep    2s
    Click Element    //div[@id='settingSection']/div/span[contains(.,'存提差 (总额)')]
    Sleep    2s
    Click Element    //div[@id='settingSection']/div/div/span[contains(.,'线上存款-金额')]
    Execute JavaScript  window.document.documentElement.scrollTop = 500;
    Sleep    2s
    Click Element    //ba-card[@id='settings']//div/button[contains(.,' 开始比较 ')]

    
#     Sleep    5s
#     Page Should Not Contain Element    //table[@id='comparisonArea']/tbody/tr/td[1][contains(.,' 线上存款-金额 ')]
#     Page Should Contain Element    //table[@id='comparisonArea']/tbody/tr/td[1][contains(.,' 存提差 ')]
#     Execute JavaScript  window.document.documentElement.scrollTop = 720;
#     Wait Until Page Contains Element  //div[@id='category']/div/div/div[@ngbtooltip='趋势详细']
#     Click Element    //div[@id='category']/div/div/div[@ngbtooltip='趋势详细']
#     Page Should Contain Element    //div[@id='categoryChart']/echarts-ng2/div/div/canvas
#     Mouse Over  //div[@id='categoryChart']/echarts-ng2/div/div/canvas
#     Capture Page Screenshot 
#     # 排序圖表 
#     Wait Until Page Contains Element  //table[@id='comparisonArea']/tbody/tr[30]/td[1]/span/i
#     Click Element   //table[@id='comparisonArea']/tbody/tr[30]/td[1]/span/i
#     Sleep  2s
#     Page Should Contain Element    //div[@id='categoryChart']/echarts-ng2/div/div/canvas
#     Mouse Over  //div[@id='categoryChart']/echarts-ng2/div/div/canvas
#     Capture Page Screenshot

#     Wait Until Page Contains Element  //div[@id='gamehall']/div/div/div[@ngbtooltip='趋势详细']
#     Click Element    //div[@id='gamehall']/div/div/div[@ngbtooltip='趋势详细']
#     Page Should Contain Element    //div[@id='hallChart']/echarts-ng2/div/div/canvas
#     Mouse Over  //div[@id='hallChart']/echarts-ng2/div/div/canvas
#     Capture Page Screenshot  
#     # 排序圖表 
#     Wait Until Page Contains Element  //table[@id='comparisonArea']/tbody/tr[40]/td[1]/span/i
#     Click Element   //table[@id='comparisonArea']/tbody/tr[40]/td[1]/span/i
#     Sleep  2s
#     Page Should Contain Element    //div[@id='hallChart']/echarts-ng2/div/div/canvas
#     Mouse Over  //div[@id='hallChart']/echarts-ng2/div/div/canvas
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
    Go To    https://ppap.pmzoe.com/login

    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    
SuiteTeardown
    Run Keyword If Any Tests Failed    Capture Page Screenshot 
    Close Browser
