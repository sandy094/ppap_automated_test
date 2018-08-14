*** Keyword ***
Check Account Page 
    [Documentation]    Check Account Page
    [Arguments]    ${account}    ${password}
    Input Account    ${account}
    Input Password    ${password}

Quick Search In Mobile
    [Documentation]    Click Time Search In Quick Search To Search
    [Arguments]    ${title}    
    Wait Until Page Contains Element   //div[@class='baDateform btn-group']/a[contains(.,'${title}')]  
    Click Link    //div[@class='baDateform btn-group']/a[contains(.,'${title}')] 
    Page Should Contain Element    //div[@class='pie-chart-item']    limit=4
    Sleep    5s
    Capture Page Screenshot

Quick Search In Seanson
    [Arguments]    ${season}
    Sleep    5s
    Wait Until Page Contains Element  //div[@class='baDateform btn-group']/div[@class='type_pick_mobile']
    Click Element    //div[@class='baDateform btn-group']/div[@class='type_pick_mobile']
    Wait Until Page Contains Element    //div[@class='baDateform btn-group']/div[@class='type_pick_mobile']/div/ul/li[contains(.,'${season}')]
    Click Element    //div[@class='baDateform btn-group']/div[@class='type_pick_mobile']/div/ul/li[contains(.,'${season}')]
    Click Element    //div[@class='page-top clearfix animated']
    Capture Page Screenshot
Check In Four Cards
    @{fourCards}    Set Variable    损益    有效投注    投注单量    活跃会员
    :FOR    ${card}    IN    @{fourCards}
    \     Click Element  //div[@class='description']/div[contains(.,'${card}')]
    \     Sleep    2s
    \     Capture Page Screenshot
    \     Click Element  //div[@class='description']/div[contains(.,'${card}')]

Search In Mounth For Mobile
    #月份比較
    [Arguments]    ${title}
    Wait Until Page Contains Element  //h5[@class='m-0']
    Sleep    3s
    Click Element  //h5[@class='m-0']
    Wait Until Page Contains Element  //div[@class='BaDateInput']
    Wait Until Page Contains Element    //div[@class='select_month']/select
    Select From List By Value    //div[@class='select_month']/select    ${title}
    Sleep    3s
    Capture Page Screenshot
    Click Element    //div[@class='page-top clearfix animated']

Check Chart By Classification
    @{elements}    Set Variable    1    2    3    4    5
    :FOR    ${i}    IN    @{elements}
    \    Select From List By Value    //select[@class='form-control noborder borderr_1px']    ${i}
    \    Sleep    10s
    \    List In Right Way

Check Chart By Station
    @{elements}    Set Variable    1    2    3    4    5
    :FOR    ${i}    IN    @{elements}
    \    Select From List By Value    //select[@class='form-control noborder borderr_1px']    ${i}
    \    Sleep    10s

Check Chart In Game Classification
    [Documentation]    Check Dashboard Chart in button
    [Arguments]    ${title}
    Click Element    //div[@class='row hidden_991']/div/div/div/button[contains(.,'${title}')]
    Check Chart By Classification
    Chart Transform

Check Chart In Game Station
    [Documentation]    Check Dashboard Chart in button
    [Arguments]    ${title}
    Click Element    //div[@class='row hidden_991']/div/div/div/button[contains(.,'${title}')]
    Check Chart By Station
    Chart Transform

Check Chart When Click list In Right
    [Documentation]    When Click list in Right
    List In Right Way
    Chart Transform
    Check Chart
    List In Right Way
    Chart Transform
    
Check Dashboard Link
    [Documentation]    Check dashboard link is correct
    [Arguments]    ${title}
    Click Sidebar Link    ${title}

Check Sidebar Link And Verify Page Title
    [Documentation]    Check sidebar link and verify this page title is correct
    [Arguments]    ${title}
    Click Sidebar Link    ${title}
    Wait Until Page Contains Element    //a[contains(.,'${title}')]

List In Right Way
    @{categorys}    Set Variable    機率    視訊    彩票    體育
    :FOR    ${category}    IN    @{categorys}
    \    Wait Until Page Contains Element    //div[@class="table-responsive"]//tr[contains(.,"${category}")]
    \    Sleep    8s
    \    Click Element    //div[@class="table-responsive"]//td[contains(.,"${category}")]
    \    Sleep    5s
    \    Page Should Contain Element    //table[@class='table dataTable']
    \    Chart Transform
    
