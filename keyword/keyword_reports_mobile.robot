*** Keyword ***
Check Account Page 
    [Documentation]    Check Account Page
    [Arguments]    ${account}    ${password}
    Input Account    ${account}
    Input Password    ${password}

Check Value Is Active 
    [Documentation]    Check value in table
    Page Should Contain Element    //table[@id='TrendInfoTable']/thead/tr[1]/th[2][contains(.,'损益')]
    Page Should Contain Element    //table[@id='TrendInfoTable']/thead/tr[1]/th[3][contains(.,'有效投注')]
    Page Should Contain Element    //table[@id='TrendInfoTable']/thead/tr[1]/th[4][contains(.,'投注单量')]
    Page Should Contain Element    //table[@id='TrendInfoTable']/thead/tr[1]/th[5][contains(.,'活跃会员')]
    Page Should Contain Element    //table[@id='TrendInfoTable']/thead/tr[1]/th[6][contains(.,'游戏人次')]
    Page Should Contain Element    //table[@id='TrendInfoTable']/thead/tr[1]/th[7][contains(.,'营收比')]
    Page Should Contain Element    //div[@id='gameListTable']//h3[contains(.,'游戏')]
    Page Should Contain Element    //div[@id='dailyListTable']//h3[contains(.,'逐日列表')]

Verify Page Title Is Correct
    [Documentation]    Verify page title is match sidebar link and match
    [Arguments]    ${title}
    Wait Until Page Contains Element    //div[@class="page-top clearfix"]/ba-content-top/div/ul/li[contains(.,'${title}')]
    Click Element    //div[@class="page-top clearfix"]/ba-content-top/div/ul/li[contains(.,'${title}')]

Quick Search botton In Mobile
    #今日.昨日..上月快搜
    [Documentation]    Click Time Search In Quick Search To Search
    [Arguments]    ${title}    
    Wait Until Element Is Visible   //div[@class="baDateform btn-group"]/a[contains(.,'${title}')]  
    Click Link    //div[@class="baDateform btn-group"]/a[contains(.,'${title}')] 
    Sleep    7s

Check the time if choose game 
    # 驗證數值
    Sleep    5s
    ${valueA}=  Get Text     //div[@id='hottestInfoTable']//tbody/tr[1]/td[2]
    # 本周
    Quick Search botton In Mobile    上周
    ${valueB}=  Get Text     //div[@id='hottestInfoTable']//tbody/tr[1]/td[2]
    ${result}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    ${valueA}=  Set Variable    ${valueB}
    Quick Search For Year And Season In Mobile    本年
    Sleep    10s
    ${valueB}=  Get Text     //div[@id='hottestInfoTable']//tbody/tr[1]/td[2]
    ${result}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    ${valueA}=  Set Variable    ${valueB}
    Search In Mounth For Mobile    0: 2019年6月
    Sleep    10s
    ${valueB}=  Get Text     //div[@id='hottestInfoTable']//tbody/tr[1]/td[2]
    ${result}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    ${valueA}=  Set Variable    ${valueB}