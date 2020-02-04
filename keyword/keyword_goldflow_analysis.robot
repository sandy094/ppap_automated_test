*** Keyword ***
Check Values
# 寫IF判斷
    Wait Until Page Contains Element    //div[@class='table-responsive']//tbody/tr
    ${getTrCounts}=   Get Element Count    //div[@class='table-responsive']//tbody/tr
    ${getTrCounts}  Evaluate   ${getTrCounts}+1   
    :FOR  ${col}  IN RANGE  2  ${getTrCounts}  1
    \  Wait Until Page Contains Element    //div[@class='table-responsive']//tbody/tr[${col}]/td[3]
    \  ${valueA}=  Get Text    //div[@class='table-responsive']//tbody/tr[${col}]/td[3]
    \  Should Not Be Empty  ${valueA}  

Check Detial For Each Day
    Wait Until Page Contains Element    //*[@id="goldflow"]/ba-card/div/div/div[2]/div[2]/div[2]/table/tbody/tr[2]/td[2]
    Click Element    //*[@id="goldflow"]/ba-card/div/div/div[2]/div[2]/div[2]/table/tbody/tr[2]/td[2]
    Capture Page Screenshot
    

Check Detial value
     ${getDetialTrCounts}=  Get Element Count    //table[@class="arbitrage_anal__Table arbitrage_anal__Table__detail table-striped"]/tbody/tr
     ${getDetialTrCounts}  Evaluate    ${getDetialTrCounts}+1
     :FOR  ${tr}  IN RANGE  2  ${getDetialTrCounts}  1
     \    Wait Until Page Contains Element    //table[@class="arbitrage_anal__Table arbitrage_anal__Table__detail table-striped"]/tbody/tr[${tr}]/td[2]
     \    ${gameName}=  Get Text    //table[@class="arbitrage_anal__Table arbitrage_anal__Table__detail table-striped"]/tbody/tr[${tr}]/td[2]
     \    Should Not Be Empty    ${gameName}

Site Detial Short
    Sleep  5s
    @{number}  Set variable  3  6  8    
    :FOR  ${num}  IN  @{number}
    \  Sleep  5s
    \  Wait Until Page Contains Element  //div[@id='site-detail']//table/thead/tr/th[${num}]//a
    \  Click Element  //div[@id='site-detail']//table/thead/tr/th[${num}]//a
    
    # 降冪
    \  ${ValueC}=  Get Text  //div[@id='site-detail']//table/tbody/tr[2]/td[${num}]
    \  ${ValueD}=  Get Text  //div[@id='site-detail']//table/tbody/tr[3]/td[${num}]
    \  ${ValueC}=    Remove String    ${ValueC}    ,
    \  ${ValueD}=    Remove String    ${ValueD}    ,
    \  Convert To Integer    ${ValueC}
    \  Convert To Integer    ${ValueD}
    \  ${request}=    Run keyword And Return Status    Should Be True  ${ValueC}>=${ValueD}
    \  Run Keyword If    '${request}'=='False'    Capture Page Screenshot    ELSE    No Operation

    \  Click Element  //div[@id='site-detail']//table/thead/tr/th[${num}]//a
    
    # 升冪
    \  ${ValueA}=  Get Text  //div[@id='site-detail']//table/tbody/tr[2]/td[${num}]
    \  ${ValueB}=  Get Text  //div[@id='site-detail']//table/tbody/tr[3]/td[${num}]
    \  ${ValueA}=    Remove String    ${ValueA}    ,
    \  ${ValueB}=    Remove String    ${ValueB}    ,
    \  Convert To Integer    ${ValueA}
    \  Convert To Integer    ${ValueB}
    \  ${request}=    Run keyword And Return Status    Should Be True  ${ValueA}<=${ValueB}
    \  Run Keyword If    '${request}'=='False'    Capture Page Screenshot   ELSE    No Operation

Game Detial Short
    Sleep  5s
    @{number}  Set variable  3  6  8    
    :FOR  ${num}  IN  @{number}
    \  Sleep  5s
    \  Wait Until Page Contains Element  //div[@id='game-detail']//table/thead/tr/th[${num}]//a
    \  Click Element  //div[@id='game-detail']//table/thead/tr/th[${num}]//a
    
    # 降冪
    \  ${ValueC}=  Get Text  //div[@id='game-detail']//table/tbody/tr[2]/td[${num}]
    \  ${ValueD}=  Get Text  //div[@id='game-detail']//table/tbody/tr[3]/td[${num}]
    \  ${ValueC}=    Remove String    ${ValueC}    ,
    \  ${ValueD}=    Remove String    ${ValueD}    ,
    \  Convert To Integer    ${ValueC}
    \  Convert To Integer    ${ValueD}
    \  ${request}=    Run keyword And Return Status    Should Be True  ${ValueC}>=${ValueD}
    \  Run Keyword If    '${request}'=='False'    Capture Page Screenshot    ELSE    No Operation

    \  Click Element  //div[@id='game-detail']//table/thead/tr/th[${num}]//a

    # 升冪
    \  ${ValueA}=  Get Text  //div[@id='game-detail']//table/tbody/tr[2]/td[${num}]
    \  ${ValueB}=  Get Text  //div[@id='game-detail']//table/tbody/tr[3]/td[${num}]
    \  ${ValueA}=    Remove String    ${ValueA}    ,
    \  ${ValueB}=    Remove String    ${ValueB}    ,
    \  Convert To Integer    ${ValueA}
    \  Convert To Integer    ${ValueB}
    \  ${request}=    Run keyword And Return Status    Should Be True  ${ValueA}<=${ValueB}
    \  Run Keyword If    '${request}'=='False'    Capture Page Screenshot   ELSE    No Operation


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

    Search In Month    0: 2020年2月  
    Sleep  20s
    Wait Until Page Contains Element    //div[@id="tableData"] //tbody/tr[2]/td[7]
    ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[7]   #驗證數值
    Should Not Be Empty  ${valueB}
    ${result}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation




