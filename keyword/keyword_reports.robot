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
    Page Should Contain Element    //div[@class='text-center'][contains(.,'損益')]
    Page Should Contain Element    //div[@class='text-center'][contains(.,'有效投注')]
    Page Should Contain Element    //div[@class='text-center'][contains(.,'單量')]
    Page Should Contain Element    //div[@class='text-center'][contains(.,'咬度')]
    Page Should Contain Element    //div[@class='card-body'][contains(.,'游戏种类')]
    Page Should Contain Element    //div[@class='card-body'][contains(.,'时间')]

Verify Page Title Is Correct
    [Documentation]    Verify page title is match sidebar link and match
    [Arguments]    ${title}
    Wait Until Page Contains Element    //div[@class="page-top clearfix"]/ba-content-top/div/ul/li[contains(.,'${title}')]
    Click Element    //div[@class="page-top clearfix"]/ba-content-top/div/ul/li[contains(.,'${title}')]