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
    Page Should Contain Element    //div[@class='card-body'][contains(.,'游戏')]
    Page Should Contain Element    //div[@class='card-body'][contains(.,'时间')]

Check the time if choose game 
     ${valueA}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
     Quick Search botton   上周
     Sleep  5s
     Check Value Is Active
     ${valueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
     Should Not Match    ${valueA}  ${valueB}
     ${valueA}  Set Variable    ${valueB}   
     Capture Page Screenshot

     Quick Search In year and season    本季
     Sleep  20s
     Check Value Is Active
     ${valueA}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
     Should Not Match    ${valueA}  ${valueB}
     ${valueA}  Set Variable    ${valueB}
     Capture Page Screenshot 

     Search In Month    0: 2019年1月
     Sleep  10s
     Check Value Is Active
     ${valueB}=  Get Text  //table[@id='TrendInfoTable']/tbody/tr[1]/td[2]
     Should Not Match    ${valueA}  ${valueB}

     Reload Page

Verify Page Title Is Correct
    [Documentation]    Verify page title is match sidebar link and match
    [Arguments]    ${title}
    Wait Until Page Contains Element    //div[@class="page-top clearfix"]/ba-content-top/div/ul/li[contains(.,'${title}')]
    Click Element    //div[@class="page-top clearfix"]/ba-content-top/div/ul/li[contains(.,'${title}')]

