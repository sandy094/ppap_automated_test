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

Check Values
# 寫IF判斷
    Wait Until Page Contains Element    //div[@id="tableData"] //tbody/tr[2]/td[6]
    Should Not Be Empty    //div[@id="tableData"] //tbody/tr[2]/td[6]
    @{cols}  Set Variable  3  6  7  8  9   
    :FOR  ${col}  IN  @{cols}
    \  Wait Until Page Contains Element    //div[@id="tableData"] //tbody/tr[2]/td[${col}]
    \  ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[${col}]
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
    \  ${request}=    Run keyword And Return Status    Should Be True  ${ValueA}<=${ValueB}
    \  Run Keyword If    '${request}'=='False'    Capture Page Screenshot   ELSE    No Operation

    # 降冪
    \  Click Element  //div[@class='DETAIL-TABLE']//table/thead/tr[1]/th[${num}]//a
    \  ${ValueC}=  Get Text  //div[@class="DETAIL-TABLE"]//table/tbody/tr[1]/td[${num}]
    \  ${ValueD}=  Get Text  //div[@class="DETAIL-TABLE"]//table/tbody/tr[2]/td[${num}]
    \  ${ValueC}=    Remove String    ${ValueC}    ,
    \  ${ValueD}=    Remove String    ${ValueD}    ,
    \  Convert To Integer    ${ValueC}
    \  Convert To Integer    ${ValueD}
    \  ${request}=    Run keyword And Return Status    Should Be True  ${ValueC}>=${ValueD}
    \  Run Keyword If    '${request}'=='False'    Capture Page Screenshot    ELSE    No Operation

Check the time if choose game 
    ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[3]
    Quick Search botton   上周
    Wait Until Page Contains Element    //div[@id="tableData"] //tbody/tr[2]/td[3]
    ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[3]   #驗證數值
    Should Not Be Empty  ${valueB} 
    ${result}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    ${valueA}  Set Variable    ${valueB}   
    Capture Page Screenshot
# 本季搜尋時間過長 待改善
    Quick Search In year and season    本季
    Sleep  20s
    Wait Until Page Contains Element    //div[@id="tableData"] //tbody/tr[2]/td[3]
    ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[3]   #驗證數值
    Should Not Be Empty  ${valueB}
    ${result}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    ${valueA}  Set Variable    ${valueB}
    Capture Page Screenshot 

    Search In Month    0: 2019年8月 
    Sleep  20s
    Wait Until Page Contains Element    //div[@id="tableData"] //tbody/tr[2]/td[3]
    ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[3]   #驗證數值
    Should Not Be Empty  ${valueB}
    ${result}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation

    



