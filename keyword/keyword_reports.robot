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
    Page Should Contain Element    //table[@id='TrendInfoTable']/thead/tr[1]/th[6][contains(.,'营收比')]
    Page Should Contain Element    //div[@class='card-body'][contains(.,'游戏种类')]
    Page Should Contain Element    //div[@class='card-body'][contains(.,'时间')]

Verify Page Title Is Correct
    [Documentation]    Verify page title is match sidebar link and match
    [Arguments]    ${title}
    Wait Until Page Contains Element    //div[@class="page-top clearfix"]/ba-content-top/div/ul/li[contains(.,'${title}')]
    Click Element    //div[@class="page-top clearfix"]/ba-content-top/div/ul/li[contains(.,'${title}')]