*** Keyword ***
Check Account Page 
    [Documentation]    Check Account Page
    [Arguments]    ${account}    ${password}
    Input Account    ${account}
    Input Password    ${password}

Check Game Information Link
    [Documentation]    Click operational information link to check link is correct 
    [Arguments]    ${title}    
    Click Topbar Link    ${title}
 
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
    @{cols}  Set Variable  2  3  4  5   
    :FOR  ${col}  IN  @{cols}
    \  Wait Until Page Contains Element    //div[@id="tableData"] //tbody/tr[2]/td[${col}]
    \  ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[1]/td[${col}]
    \  Should Not Be Empty  ${valueA}  

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

Check the time if choose game 
    ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[7]
    Quick Search botton   上周
    Sleep  50s
    Wait Until Page Contains Element    //div[@id="tableData"] //tbody/tr[2]/td[7]
    ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[7]   #驗證數值
    Should Not Be Empty  ${valueB} 
    ${result}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    ${valueA}  Set Variable    ${valueB}   
    Capture Page Screenshot
# 本季搜尋時間過長 待改善
    # Quick Search In year and season    本季
    # Sleep  20s
    # Wait Until Page Contains Element    //div[@id="tableData"] //tbody/tr[2]/td[7]
    # ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[7]   #驗證數值
    # Should Not Be Empty  ${valueB}
    # ${result}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    # Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    # ${valueA}  Set Variable    ${valueB}
    # Capture Page Screenshot 

    # Sleep  5s
    Search In Month    0: 2019年3月
    Sleep  50s
    Wait Until Page Contains Element    //div[@id="tableData"] //tbody/tr[2]/td[7]
    ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[7]   #驗證數值
    Should Not Be Empty  ${valueB}
    ${result}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation

    



