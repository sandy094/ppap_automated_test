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
    Page Should Contain Element    //table[@id='TrendInfoTable']/tbody/tr[1]/td[contains(.,'损益')]
    Page Should Contain Element    //table[@id='TrendInfoTable']/tbody/tr[2]/td[contains(.,'有效投注')]
    Page Should Contain Element    //table[@id='TrendInfoTable']/tbody/tr[3]/td[contains(.,'投注单量')]
    Page Should Contain Element    //table[@id='TrendInfoTable']/tbody/tr[4]/td[contains(.,'活跃会员')]
    Page Should Contain Element    //table[@id='TrendInfoTable']/tbody/tr[5]/td[contains(.,'营收比')]
    Page Should Contain Element    //div[@class='card-body'][contains(.,'游戏种类')]
    Page Should Contain Element    //div[@class='card-body'][contains(.,'时间')]

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
    Sleep    5s

Quick Search For Year And Season In Mobile
    #本年.本季快搜
    [Arguments]    ${title}
    Sleep    10s
    Page Should Contain Element    //div[@class="row mobile_fill_height"]//div[@class="type_pick_mobile"]/i
    Click Element    //div[@class="row mobile_fill_height"]//div[@class="type_pick_mobile"]/i
    Wait Until Page Contains Element    //div[@class="row mobile_fill_height"]//div[@class="type_pick"]/ul/li[contains(.,'${title}')]
    Sleep    5s
    Click Element    //div[@class="row mobile_fill_height"]//div[@class="type_pick"]/ul/li[contains(.,'${title}')]
    Sleep    10s
    Click Element    //div[@class='type_bgcolor']
    Capture Page Screenshot

Search In Mounth For Mobile 
    #月份比較 
    [Arguments]    ${title}
    Wait Until Page Contains Element  //div[@class='card-body']/h5
    Click Element     //div[@class='card-body']/h5
    Sleep    5s
    Mouse Over    //div[@class='selectDate_Click']
    Wait Until Page Contains Element    //div[@class='select_month']/select
    Select From List By Value    //div[@class='select_month']/select    ${title}
    Sleep    5s
    Capture Page Screenshot