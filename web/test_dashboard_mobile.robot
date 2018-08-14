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
    Sleep    10s
    Click Topbar Link      站台列表
    Click Topbar Link     游戏占比
    Click Topbar Link     运营看板
    No Operation

Click Search
    Sleep    10s
    Quick Search In Mobile    今日
    Check In Four Cards

    # Click Element  //ba-card[@class='dashboss_chart commissionableSums']//button[@id='sortMenu']
    # Click Element  //ba-card[@class='dashboss_chart commissionableSums']//a[contains(.,"以日合計")]

    Quick Search In Seanson    本季
    # Check In Four Cards

    Quick search in mobile    昨日  
    Check In Four Cards

    Quick Search In Seanson    本年
    # Check In Four Cards
    
    @{weeks}  Set Variable  本周  上周
    :FOR  ${week}  IN  @{weeks}
    \  Quick Search In Mobile    ${week}
    \  Check In Four Cards

    Quick Search In Seanson    去年
    # Check In Four Cards

    @{years}  Set Variable  本月  上月  
    :FOR  ${year}  IN  @{years}
    \  Quick Search In Mobile    ${year}
    \  Check In Four Cards

    Quick Search In Seanson    上季
    # Check In Four Cards
    
    Reload Page
Check Chart is active
    Sleep    10s
    Wait Until Page Contains Element  //button[@class='btn_25 borderr_1px']
    Click Element  //button[@class='btn_25 borderr_1px']
    # Wait Until Page Contains Element  //div[@style='display:inline-block'][contains(.,'機率')]
    # Mouse Over  //div[@style='display:inline-block'][contains(.,'機率')]
    # Click Element  //div[@style='display:inline-block'][contains(.,'機率')]
    # Wait Until Page Contains Element  //table[@class='table table-hover']
    # Check Chart In Game Classification    种类
    # Check Chart In Game Station    娱乐城

Search In Datetime 
    Search In Mounth For Mobile    0: 2018年5月
    Search In Mounth For Mobile    1: 2018年4月
    # Search In Mounth For Mobile    2: 2018年3月
    # @{mounths}    Set Variable    0: 2018年5月  1: 2018年4月  2: 2018年3月  3: 2018年2月  4: 2018年1月  5: 2017年12月  6: 2017年11月  7: 2017年10月  8: 2017年9月  9: 2017年8月  10: 2017年7月  11: 2017年6月  12: 2017年5月
    # :FOR    ${month}  IN  @{mounths}
    # \  Search In Mounth For Mobile    ${month}
    # \  Check In Four Cards

*** Keywords ***
SuiteSetup
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Set Window Size  414  736
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    
SuiteTeardown
    Close Browser
