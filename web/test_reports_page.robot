*** Settings ***
Force Tags    Login
Suite Setup    SuiteSetup
Suite Teardown    SuiteTeardown
Resource    ../lib/resource.robot
Resource    ../keyword/keyword_common.robot
Resource    ../keyword/keyword_reports.robot

*** Test Cases ***
Check login
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}

Check sidebar link Operational navigation is correct
    # Wait Until Page Contains Element    //div[@class='container bg-white boss-know-panel']//button[1]
    # Click Element  //div[@class='container bg-white boss-know-panel']//button[1]
    Check Operational Information Link    报表呈现

Click Search
    Sleep    20s
    ${CheckValueA}=  Get Text  //table[@id="TrendInfoTable"]//tbody/tr[1]/td[2]
    @{days}  Set Variable    本周  上周  本月  上月  昨日
    :FOR  ${day}  IN  @{days}
    \  Quick Search botton    ${day}
    \  Check Value Is Active
    \  ${CheckValueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[3]
    \  Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  ${CheckValueA}=  Set Variable  ${CheckValueB}

    ${CheckValueA}=  Get Text  //table[@id="TrendInfoTable"]//tbody/tr[1]/td[2]
    @{years}  Set Variable  本年  去年  本季  上季
    :FOR  ${year}  IN  @{years}
    \  Quick Search In Year And Season    ${year}
    \  Check Value Is Active
    \  ${CheckValueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
    \  Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  ${CheckValueA}=  Set Variable  ${CheckValueB}


Search In Datetime 
    ${CheckValueA}=  Get Text  //table[@id="TrendInfoTable"]//tbody/tr[1]/td[2]
    @{mounths}    Set Variable    0: 2018年8月  1: 2018年7月  2: 2018年6月  3: 2018年5月  4: 2018年4月  5: 2018年3月  6: 2018年2月  7: 2018年1月  8: 2017年12月  9: 2017年11月  10: 2017年10月  11: 2017年9月  12: 2017年8月
    :FOR    ${month}  IN  @{mounths}
    \  Search In Month    ${month}
    \  ${CheckValueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
    \  Should Not Match  ${CheckValueA}  ${CheckValueB}
    \  ${CheckValueA}=  Set Variable  ${CheckValueB}

*** Keywords ***
SuiteSetup
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    
SuiteTeardown
    Close Browser
