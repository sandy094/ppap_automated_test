*** Keyword ***
Check Values
# 寫IF判斷
    ${getElements}=   Get Element Count    //table[@class='arbitrage_anal__Table table-striped']/tbody/tr
    # @{cols}  Set Variable  3  4  5   
    :FOR  ${col}  IN  2  ${getElements}  1
    \  Wait Until Page Contains Element    //table[@class='arbitrage_anal__Table table-striped']/tbody/tr[2]/td[${col}]
    \  ${valueA}=  Get Text    //table[@class='arbitrage_anal__Table table-striped']/tbody/tr[2]/td[${col}]
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
    ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[7]
    Quick Search botton   上周
    Wait Until Page Contains Element    //div[@id="tableData"] //tbody/tr[2]/td[7]
    ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[7]   #驗證數值
    Should Not Be Empty  ${valueB} 
    ${result}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    ${valueA}  Set Variable    ${valueB}   
    Capture Page Screenshot
# 本季搜尋時間過長 待改善
    Quick Search botton    本季
    Sleep  20s
    Wait Until Page Contains Element    //div[@id="tableData"] //tbody/tr[2]/td[7]
    ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[7]   #驗證數值
    Should Not Be Empty  ${valueB}
    ${result}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    ${valueA}  Set Variable    ${valueB}
    Capture Page Screenshot 

    Search In Month    0: 2019年9月  
    Sleep  20s
    Wait Until Page Contains Element    //div[@id="tableData"] //tbody/tr[2]/td[7]
    ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[7]   #驗證數值
    Should Not Be Empty  ${valueB}
    ${result}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation




