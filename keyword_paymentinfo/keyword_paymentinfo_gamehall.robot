*** Keyword ***
Check Game Information Link
    [Documentation]    Click operational information link to check link is correct 
    [Arguments]    ${title}    
    Click Sidebar Link    ${title}
 
Check Topbar Link
    [Arguments]    ${title}
    Click Element    //li/a[contains(.,'${title}')]

Check Values
# 寫IF判斷
    Wait Until Page Contains Element    //ng2-smart-table[@class='gamehall__tb']/table/tbody/tr/td[2]
    Should Not Be Empty    //ng2-smart-table[@class='gamehall__tb']/table/tbody/tr/td[2]
    ${getValue}=  Get Text    //ng2-smart-table[@class='gamehall__tb']/table/tbody/tr/td[2]


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
    Quick Search botton    本季
    Sleep  20s
    Wait Until Page Contains Element    //div[@id="tableData"] //tbody/tr[2]/td[3]
    ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[3]   #驗證數值
    Should Not Be Empty  ${valueB}
    ${result}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    ${valueA}  Set Variable    ${valueB}
    Capture Page Screenshot 

    Search In Month    0: 2020年5月  
    Sleep  20s
    Wait Until Page Contains Element    //div[@id="tableData"] //tbody/tr[2]/td[3]
    ${valueB}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[3]   #驗證數值
    Should Not Be Empty  ${valueB}
    ${result}=  Run Keyword And Return Status    Should Not Match    ${valueA}  ${valueB}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation

    
Get Input Element  
   ${inputCounts}=  Get Element Count    //div[@class='accordion']/div[${gamehall}]/div/ul/li/label
   

