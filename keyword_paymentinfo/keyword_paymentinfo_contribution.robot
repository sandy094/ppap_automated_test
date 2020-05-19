*** Keyword ***
Check Game Information Link
    [Documentation]    Click operational information link to check link is correct 
    [Arguments]    ${title}    
    Click Sidebar Link    ${title}
 
Check Topbar Link
    [Arguments]    ${title}
    Click Element    //li/a[contains(.,'${title}')]

Time Quicker
    [Documentation]    Change timer
    @{days}  Set Variable    昨日  本周  上周  本月  上月  本季  上季  本年  
    :FOR  ${day}  IN  @{days}
    \  Quick Search botton    ${day}
    \  Sleep    20s
    # 暫時改成30s
    \  Wait Until Page Contains Element    //table[@id='divDetail']/tbody/tr[1]/td[3]
    \  Should Not Be Empty    //table[@id='divDetail']/tbody/tr[1]/td[3]//span[1]
    \  ${getValue}=  Get Text    //table[@id='divDetail']/tbody/tr[1]/td[3]
    \  ${hallName}=  Get Text    //h3[@id='h3']
    \  Click Element    //table[@id='divDetail']/tbody/tr[1]/td[2]
    \  Page Should Contain Element   //ng2-smart-table[@class='table-striped']/table/tbody/tr[1]/td[3]
    \  ${getSiteValue}=  Get Text   //ng2-smart-table[@class='table-striped']/table/tbody/tr[1]/td[3]



