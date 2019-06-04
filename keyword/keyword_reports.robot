*** Keyword ***
Check Account Page 
    [Documentation]    Check Account Page
    [Arguments]    ${account}    ${password}
    Input Account    ${account}
    Input Password    ${password}

Check Operational Information Link
    [Documentation]    Click operational information link to check link is correct 
    [Arguments]    ${title}    
    Click Sidebar Link    ${title}
 
Check Topbar Link
    [Arguments]    ${title}
    Click Element    //li/a[contains(.,'${title}')]

Check Value Is Active
    [Documentation]    Check value in table
    Page Should Contain Element    //table[@id='TrendInfoTable']/thead/tr[1]/th[2][contains(.,'损益')]
    Page Should Contain Element    //table[@id='TrendInfoTable']/thead/tr[1]/th[3][contains(.,'有效投注')]
    Page Should Contain Element    //table[@id='TrendInfoTable']/thead/tr[1]/th[4][contains(.,'投注单量')]
    Page Should Contain Element    //table[@id='TrendInfoTable']/thead/tr[1]/th[5][contains(.,'活跃会员')]
    Page Should Contain Element    //table[@id='TrendInfoTable']/thead/tr[1]/th[6][contains(.,'游戏人次')]
    Page Should Contain Element    //table[@id='TrendInfoTable']/thead/tr[1]/th[7][contains(.,'营收比')]
    Page Should Contain Element    //div[@id='gameListTable'][contains(.,'游戏种类')]
    Page Should Contain Element    //div[@id='dailyListTable'][contains(.,'逐日列表')]

Check the time if choose game 
    # Execute JavaScript    window.document.documentElement.scrollTop = 0;
    ${valueA}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
    Quick Search botton   上周
    Sleep  5s
    # 判斷要檢查的欄位
    ${Count}=  Get Element Count   //table[@id='TrendInfoTable']/thead/tr[1]/th
    Run Keyword If    '${Count}'=='6'   Check Field Is Active Without Memeber    ELSE    Check Value Is Active
    ${valueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
    Run Keyword If    '${valueB}'=='0'   Capture Page Screenshot    ELSE    No Operation
    ${result}=  Run Keyword And Return Status   Should Not Match    ${valueA}  ${valueB}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    ${valueA}  Set Variable    ${valueB}   

    Execute JavaScript    window.document.documentElement.scrollTop = 0;

    Quick Search In year and season    本季
    Sleep  20s
    Run Keyword If    '${Count}'=='6'   Check Field Is Active Without Memeber    ELSE    Check Value Is Active
    ${valueA}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
    Run Keyword If    '${valueA}'=='0'   Capture Page Screenshot    ELSE    No Operation
    ${result}=  Run Keyword And Return Status   Should Not Match    ${valueA}  ${valueB}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    ${valueA}  Set Variable    ${valueB}

    Execute JavaScript    window.document.documentElement.scrollTop = 0;

    Search In Month    0: 2019年6月 
    Sleep  10s
    Run Keyword If    '${Count}'=='6'   Check Field Is Active Without Memeber    ELSE    Check Value Is Active
    ${valueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
    Run Keyword If    '${valueB}'=='0'   Capture Page Screenshot    ELSE    No Operation
    ${result}=  Run Keyword And Return Status   Should Not Match    ${valueA}  ${valueB}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation


Check Field Is Active Without Memeber  
    [Documentation]    Check value in table
    Page Should Contain Element    //table[@id='TrendInfoTable']/thead/tr[1]/th[2][contains(.,'损益')]
    Page Should Contain Element    //table[@id='TrendInfoTable']/thead/tr[1]/th[3][contains(.,'有效投注')]
    Page Should Contain Element    //table[@id='TrendInfoTable']/thead/tr[1]/th[4][contains(.,'投注单量')]
    Page Should Contain Element    //table[@id='TrendInfoTable']/thead/tr[1]/th[5][contains(.,'游戏人次')]
    Page Should Contain Element    //table[@id='TrendInfoTable']/thead/tr[1]/th[6][contains(.,'营收比')]
    Page Should Contain Element    //div[@id='gameListTable'][contains(.,'游戏列表')]
    Page Should Contain Element    //div[@id='dailyListTable'][contains(.,'逐日列表')]

Verify Page Title Is Correct
    [Documentation]    Verify page title is match sidebar link and match
    [Arguments]    ${title}
    Wait Until Page Contains Element    //div[@class="page-top clearfix"]/ba-content-top/div/ul/li[contains(.,'${title}')]
    Click Element    //div[@class="page-top clearfix"]/ba-content-top/div/ul/li[contains(.,'${title}')]

