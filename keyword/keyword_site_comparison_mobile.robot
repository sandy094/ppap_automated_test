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

Check Search Condition Is correct
    Sleep   5s
    Execute JavaScript  window.document.documentElement.scrollTop = 330;
    Page Should Contain Element    //table[@id='comparisonArea']/tbody/tr/td[1][contains(.,' 活跃会员-留失率 ')]
    Page Should Contain Element    //table[@id='comparisonArea']/tbody/tr/td[1][contains(.,' 优惠 ')]
    Page Should Contain Element    //table[@id='comparisonArea']/tbody/tr/td[1][contains(.,' 线上存款-金额 ')]
    Page Should Contain Element    //table[@id='comparisonArea']/tbody/tr/td[1][contains(.,' 线上取款-金额 ')]
    Page Should Contain Element    //table[@id='comparisonArea']/tbody/tr/td[1][contains(.,' 首存总额 ')]
    # 有效投注
    ${totalValueA}=  Get Text  //table[@id='comparisonArea']/tbody/tr[5]/td[2]  
    ${result}=  Run Keyword And Return Status    Should Not Be Empty  ${totalValueA}
    ${totalValueB}=  Get Text  //table[@id='comparisonArea']/tbody/tr[5]/td[3]
    ${result}=  Run Keyword And Return Status    Should Not Be Empty  ${totalValueB}
    # 種類數據 第一排序 數值
    Sleep   5s
    Execute JavaScript  window.document.documentElement.scrollTop = 1300;
    Page Should Contain Element    //table[@id='comparisonArea']/tbody/tr/td[1][contains(.,' 种类 数据占比 ')]
    ${categoryValueA}=  Get Text  //table[@id='comparisonArea']/tbody/tr[25]/td[3] 
    ${result}=  Run Keyword And Return Status    Should Not Be Empty  ${categoryValueA}
    ${categoryValueB}=  Get Text  //table[@id='comparisonArea']/tbody/tr[25]/td[5]
    ${result}=  Run Keyword And Return Status    Should Not Be Empty  ${categoryValueB}
    # 娛樂廳 數據占比 第一排序
    Page Should Contain Element   //table[@id='comparisonArea']/tbody/tr/td[1][contains(.,' 娱乐厅 数据占比 ')]
    ${hallValueA}=  Get Text  //table[@id='comparisonArea']/tbody/tr[35]/td[3]    
    ${result}=  Run Keyword And Return Status  Should Not Be Empty  ${hallValueA}
    ${hallValueB}=  Get Text  //table[@id='comparisonArea']/tbody/tr[35]/td[5]    
    ${result}=  Run Keyword And Return Status  Should Not Be Empty  ${hallValueB}
    # 存款 線上存款金額 次數
    Execute JavaScript  window.document.documentElement.scrollTop = 2500;
    Page Should Contain Element    //table[@id='comparisonArea']/tbody/tr/td[1][contains(.,' 存款占比 ')]
    ${saveValueA}=  Get Text   //table[@id='comparisonArea']/tbody/tr[51]/td[3]
    ${result}=  Run Keyword And Return Status  Should Not Be Empty  ${value}
    ${saveValueB}=  Get Text   //table[@id='comparisonArea']/tbody/tr[57]/td[3]
    ${result}=  Run Keyword And Return Status  Should Not Be Empty  ${value}
    # 取款 線上存款金額 次數
    Page Should Contain Element    //table[@id='comparisonArea']/tbody/tr/td[1][contains(.,' 取款占比 ')]
    ${withdrawalValueA}=  Get Text  //table[@id='comparisonArea']/tbody/tr[65]/td[3]
    ${result}=  Run Keyword And Return Status  Should Not Be Empty  ${withdrawalValueA}
    ${withdrawalValueB}=  Get Text  //table[@id='comparisonArea']/tbody/tr[65]/td[5]
    ${result}=  Run Keyword And Return Status  Should Not Be Empty  ${withdrawalValueB}
    # 存提差 首存總額
    Execute JavaScript  window.document.documentElement.scrollTop = 3200;
    Page Should Contain Element    //table[@id='comparisonArea']/tbody/tr/td[1][contains(.,' 存提差比较 ')]
    ${fistSave}=  Get Text    //table[@id='comparisonArea']/tbody/tr[74]/td[2]
    ${result}=  Run Keyword And Return Status  Should Not Be Empty  ${fistSave}

Verification Value
    # 驗證數值
    ${checkValueB}=  Get Text    //table[@id='comparisonArea']/tbody/tr[3]/td[2]
    ${result}=  Runkeyword And Return Status    Should Not Match    ${checkValueA}  ${checkValueB}
    ${checkValueA}  Set Variable  ${checkValueB}
    ${checkValueD}=  Get Text    //table[@id='comparisonArea']/tbody/tr[3]/td[3]
    ${result}=  Runkeyword And Return Status    Should Not Match    ${checkValueC}  ${checkValueD}
    ${checkValueC}  Set Variable  ${checkValueD}