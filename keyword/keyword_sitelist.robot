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
    @{cols}  Set Variable  3  4  5  6  7 
    :FOR  ${C}  IN  @{cols}  
    \  ${values}=  Get Text  //div[@id="data-table"]//table/tbody/tr[1]/td[${C}]
    \  Should Not Be Empty  ${values}
    #   Wait For Condition

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

    \  Click Element  //div[@class="modal-content"]//div/span[2]/a
    \  Sleep  5s
    \  Wait Until Page Contains Element  //div[@class='container bg-white test']//canvas
    \  Mouse Over  //div[@class='container bg-white test']//canvas
    \  Capture Page Screenshot
    
    \  Click Element  //div[@class="modal-content"]//div/span[3]/a
    \  Sleep  5s
    \  Wait Until Page Contains Element  //div[@class='container bg-white test']//canvas
    \  Mouse Over  //div[@class='container bg-white test']//canvas
    \  Capture Page Screenshot
    \  Click Element  //div[@class="modal-content"]//div/i
