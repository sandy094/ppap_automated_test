*** Keyword ***
Check Account Page 
    [Documentation]    Check Account Page
    [Arguments]    ${account}    ${password}
    Input Account    ${account}
    Input Password    ${password}

Check Game Information Link
    [Documentation]    Click operational information link to check link is correct 
    [Arguments]    ${title}    
    Click Sidebar Link    ${title}
 
Check Topbar Link
    [Arguments]    ${title}
    Click Element    //li/a[contains(.,'${title}')]

Verify Page Title Is Correct
    [Documentation]    Verify page title is match sidebar link and match
    [Arguments]    ${title}
    Wait Until Page Contains Element    //div[@class="page-top clearfix"]/ba-content-top/div/ul/li[contains(.,'${title}')]
    Click Element    //div[@class="page-top clearfix"]/ba-content-top/div/ul/li[contains(.,'${title}')]

Check Values
# 寫IF判斷
    @{cols}  Set Variable  2  3  4  5  6 
    :FOR  ${col}  IN  @{cols}
    \  Wait Until Page Contains Element  //div[@class='inner']//table/tbody/tr[1]/td[${col}]
    \  ${value}=  Get Text  //div[@class='inner']//table/tbody/tr[1]/td[${col}]
    \  Should Not Be Empty  ${value}

Short
    Sleep  5s
    @{number}  Set variable  3  4  5  6  
    :FOR  ${num}  IN  @{number}
    \  Sleep  5s
    \  Wait Until Page Contains Element  //div[@class='DETAIL-TABLE']//table/thead/tr[1]/th[${num}]//a
    \  Click Element  //div[@class='DETAIL-TABLE']//table/thead/tr[1]/th[${num}]//a
    # 升冪
    \  ${ValueA}=  Get Text  //div[@class="DETAIL-TABLE"]//table/tbody/tr[1]/td[${num}]
    \  ${ValueB}=  Get Text  //div[@class="DETAIL-TABLE"]//table/tbody/tr[2]/td[${num}]
    \  ${ValueA}=    Remove String    ${ValueA}    ,
    \  ${ValueB}=    Remove String    ${ValueB}    ,
    \  Convert To Integer    ${ValueA}
    \  Convert To Integer    ${ValueB}
    \  Should Be True  ${ValueA}<=${ValueB}
    \  Capture Page Screenshot

    # 降冪
    \  Click Element  //div[@class='DETAIL-TABLE']//table/thead/tr[1]/th[${num}]//a
    \  ${ValueC}=  Get Text  //div[@class="DETAIL-TABLE"]//table/tbody/tr[1]/td[${num}]
    \  ${ValueD}=  Get Text  //div[@class="DETAIL-TABLE"]//table/tbody/tr[2]/td[${num}]
    \  ${ValueC}=    Remove String    ${ValueC}    ,
    \  ${ValueD}=    Remove String    ${ValueD}    ,
    \  Convert To Integer    ${ValueC}
    \  Convert To Integer    ${ValueD}
    \  Should Be True  ${ValueC}>=${ValueD}
    \  Capture Page Screenshot