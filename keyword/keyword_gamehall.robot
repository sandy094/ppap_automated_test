*** Keyword ***
Check Account Page 
    [Documentation]    Check Account Page
    [Arguments]    ${account}    ${password}
    Input Account    ${account}
    Input Password    ${password}

Search In Time
    Sleep    10s
    ${txtValueA}=  Get Text    //ng2-smart-table[@class='gamehall_TB']//tbody/tr/td[2]
    @{days}  Set Variable      上周  本月  上月  昨日
    :FOR  ${day}  IN  @{days}
    \  Quick Search botton    ${day}
    \  Sleep  5s
    \  ${txtValueB}=  Get Text    //ng2-smart-table[@class='gamehall_TB']//tbody/tr/td[2]
    \  Run Keyword If    '${txtValueB}'=='0'    Capture Page Screenshot
    \  Should Not Match    ${txtValueA}  ${txtValueB}
    \  ${txtValueA}   Set Variable    ${txtValueB}

Search In Year
    ${tableValueA}    Set Variable    0
    @{seasons}  Set Variable  本年  去年  本季  上季
    :FOR  ${season}  IN  @{seasons}
    \  Quick Search In year and season    ${season}
    \  Sleep  20s
    \  ${tableValueB}=  Get Text  //ng2-smart-table[@class='gamehall_TB']//tbody/tr/td[2]
    \  Run Keyword If    '${tableValueB}'=='0'    Capture Page Screenshot    ELSE    No Operation
    \  Should Not Match    ${tableValueA}  ${tableValueB}
    \  ${tableValueA}  Set Variable    ${tableValueB}

Search In Datetime 
    Sleep  5s
    ${tableValueA}    Set Variable    0
    @{mounths}    Set Variable    0: 2019年1月  1: 2018年12月  2: 2018年11月  3: 2018年10月  4: 2018年9月  5: 2018年8月  6: 2018年7月  
    :FOR    ${month}  IN  @{mounths}
    \  Search In Month    ${month}
    \  Sleep    10s
    \  ${tableValueB}=  Get Text  //ng2-smart-table[@class='gamehall_TB']//tbody/tr/td[2]
    \  Run Keyword If    '${tableValueB}'=='0'    Capture Page Screenshot    ELSE    No Operation
    \  Should Not Match    ${tableValueA}  ${tableValueB}
    \  ${tableValueA}  Set Variable    ${tableValueB}
