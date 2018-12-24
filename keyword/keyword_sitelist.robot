*** Keyword ***
Check Account Page 
    [Documentation]    Check Account Page
    [Arguments]    ${account}    ${password}
    Input Account    ${account}
    Input Password    ${password}

Check Operational Information Link
    [Documentation]    Click operational information link to check link is correct 
    [Arguments]    ${title}    
    Click Topbar Link     ${title}
 
Check Topbar Link
    [Arguments]    ${title}
    Click Element    //li/a[contains(.,'${title}')]

Check Values
    # 判斷是否有更新頁面
    ${orignalValue}  Set Variable  //div[@id="data-table"]//table/tbody/tr[1]/td[3]
    @{columns}  Set Variable  3  4  5  6  7 
    :FOR  ${column}  IN  @{columns}  
    \  Wait Until Page Contains Element    //div[@id="data-table"]//table/tbody/tr[1]/td[${column}]
    \  ${newValue}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[${column}]
    \  Should Not Be Empty  ${newValue}
    \  Should Not Match    ${orignalValue}    ${newValue}
    \  ${orignalValue}    Set Variable    ${newValue}

Search In Group
    [Documentation]    Click the tab in Group
    Click Element  //a[@class='nor_tabs mt-0'][contains(.,'分群')]
    Sleep    2s
    Capture Page Screenshot
    Click Element  //tab[@id="category"]//button[contains(.,'清除/全选')]
    
verification value
    ${classA}=    Get Text    //div[@id="data-table"]//tbody/tr[1]/td[3]//span[1]
    Should Not Be Empty  ${classA}

trend
    [Arguments]    ${tr}
    # 趨勢圖
    @{tds}  Set Variable  3  4  5  6  7  8
    :FOR  ${td}  IN  @{tds}
    \  Wait Until Page Contains Element  //div[@id="data-table"]//table/tbody/tr[${tr}]/td[${td}]
    \  Click Element  //div[@id="data-table"]//table/tbody/tr[${tr}]/td[${td}]
    \  Sleep  10s
    \  Wait Until Page Contains Element  //div[@class='container bg-white test']//canvas
    \  Mouse Over  //div[@class='container bg-white test']//canvas
    \  Capture Page Screenshot
    
    \  Data Table Check Trend Of List
    \  Click Element  //div[@class='drop-select']
    \  Wait Until Page Contains Element  //div[@class='drop-select']/ul/li[1]
    \  Click Element  //div[@class='drop-select']/ul/li[1]
    # 時
    \  Click Element  //div[@class="modal-content"]//div/span[2]/a
    \  Sleep  5s
    \  Wait Until Page Contains Element  //div[@class='container bg-white test']//canvas
    \  Mouse Over  //div[@class='container bg-white test']//canvas
    \  Capture Page Screenshot
    # 日
    \  Click Element  //div[@class="modal-content"]//div/span[3]/a
    \  Sleep  5s
    \  Wait Until Page Contains Element  //div[@class='container bg-white test']//canvas
    \  Mouse Over  //div[@class='container bg-white test']//canvas
    \  Capture Page Screenshot
    # 遊戲頁籤
    \  Click Element  //div[@id='chart']/div/div/a[2]
    \  Sleep  10s
    \  Wait Until Page Contains Element  //table[@class='table-striped type-table']//tbody/tr[1]/td[2]
    \  ${testValue}=  Get Text  //table[@class='table-striped type-table']//tbody/tr[1]/td[2]
    \  Should Not Be Empty  ${testValue}
    \  Data Table Check Game Of List
    \  Click Element  //div[@class='container bg-white test']/div/i

