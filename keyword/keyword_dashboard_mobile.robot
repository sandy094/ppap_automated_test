*** Keyword ***
Check Account Page 
    [Documentation]    Check Account Page
    [Arguments]    ${account}    ${password}
    Input Account    ${account}
    Input Password    ${password}

Check Chart In Four card
    Page Should Contain Element    //div[@id='payoffSums']
    Click Element  //div[@id='payoffSums']
    Sleep    3s
    Page Should Contain Element  //ba-card[@id='payoffSumsContent']//canvas
    Capture Page Screenshot
    Click Element  //div[@id='payoffSums']

    Page Should Contain Element    //div[@id='commissionableSums']
    Click Element  //div[@id='commissionableSums']
    Page Should Contain Element    //ba-card[@id='commissionableSumsContent']//canvas
    Capture Page Screenshot
    Click Element  //div[@id='commissionableSums']

    Page Should Contain Element    //div[@id='wagersCounts']
    Click Element    //div[@id='wagersCounts']
    Page Should Contain Element    //ba-card[@id='wagersCountsContent']//canvas
    Capture Page Screenshot
    Click Element  //div[@id='wagersCounts']

    Page Should Contain Element    //div[@id='memberCounts']
    Click Element    //div[@id='memberCounts']
    Page Should Contain Element    //ba-card[@id='memberCountsContent']//canvas
    Capture Page Screenshot
    Click Element  //div[@id='memberCounts']

Count In Seven Days For yesterday Mobile
    @{cards}    Set Variable    payoffSums    commissionableSums    wagersCounts    memberCounts    
    :FOR    ${card}    IN    @{cards}
    \    Page Should Contain Element    //div[@id='${card}']
    \    Click Element    //div[@id='${card}']
    \    Wait Until Page Contains Element   //ba-card[@class='dashboss_chart ${card}']//button[@id='sortMenu']
    \    Click Element    //ba-card[@class='dashboss_chart ${card}']//button[@id='sortMenu']
    \    Click Element    //ba-card[@class='dashboss_chart ${card}']//a[contains(.,"以时合计")]
    \    Sleep    5s
    \    Page Should Contain Element    //ba-card[@class='dashboss_chart ${card}']//canvas
    \    Capture Page Screenshot
    \    Click Element    //ba-card[@class='dashboss_chart ${card}']//button[@id='sortMenu']
    \    Click Element    //ba-card[@class='dashboss_chart ${card}']//a[contains(.,"以日合计")]
    \    Sleep    5s
    \    Page Should Contain Element    //ba-card[@class='dashboss_chart ${card}']//canvas
    \    Capture Page Screenshot
    \    Click Element    //div[@id='${card}']

Count In A Day For week Mobile
    @{cards}    Set Variable    payoffSums    commissionableSums    wagersCounts    memberCounts    
    :FOR    ${card}    IN    @{cards}
    \    Page Should Contain Element    //div[@id='${card}']
    \    Click Element    //div[@id='${card}']
    \    Wait Until Page Contains Element    //ba-card[@class='dashboss_chart ${card}']//button[@id='sortMenu']
    \    Click Element    //ba-card[@class='dashboss_chart ${card}']//button[@id='sortMenu']
    \    Click Element    //ba-card[@class='dashboss_chart ${card}']//a[contains(.,"以周合计")]
    \    Sleep    5s
    \    Page Should Contain Element    //ba-card[@class='dashboss_chart ${card}']//canvas
    \    Capture Page Screenshot
    \    Click Element    //div[@id='${card}']

Count In A Day For months Mobile
    @{cards}    Set Variable    payoffSums    commissionableSums    wagersCounts    memberCounts
    :FOR    ${card}    IN    @{cards}
    \    Page Should Contain Element    //div[@id='${card}']
    \    Click Element    //div[@id='${card}']
    \    Click Element    //ba-card[@class='dashboss_chart ${card}']//button[@id='sortMenu']
    \    Wait Until Page Contains Element  //ba-card[@class='dashboss_chart ${card}']//a[contains(.,"以周合计")]
    \    Sleep    5s
    \    Click Element    //ba-card[@class='dashboss_chart ${card}']//a[contains(.,"以周合计")]
    \    Page Should Contain Element    //ba-card[@class='dashboss_chart ${card}']//canvas
    \    Capture Page Screenshot
    \    Click Element    //ba-card[@class='dashboss_chart ${card}']//button[@id='sortMenu']
    \    Wait Until Page Contains Element  //ba-card[@class='dashboss_chart ${card}']//a[contains(.,"以月合计")]
    \    Click Element    //ba-card[@class='dashboss_chart ${card}']//a[contains(.,"以月合计")]
    \    Sleep    5s
    \    Page Should Contain Element    //ba-card[@class='dashboss_chart ${card}']//canvas
    \    Capture Page Screenshot
    \    Click Element    //div[@id='${card}']

Quick Search In Mobile
    [Documentation]    Click Time Search In Quick Search To Search
    [Arguments]    ${title}    
    Wait Until Page Contains Element   //div[@class='baDateform btn-group']/a[contains(.,'${title}')]  
    Click Link    //div[@class='baDateform btn-group']/a[contains(.,'${title}')] 
    Page Should Contain Element    //div[@class='pie-chart-item']    limit=4
    Sleep    5s
    Capture Page Screenshot

Quick Search For Year And Season In Mobile
    #本年.本季快搜
    [Arguments]    ${title}
    Sleep    10s
    Page Should Contain Element    //div[@class="row mobile_fill_height"]//div[@class="type_pick_mobile"]/i
    Click Element    //div[@class="row mobile_fill_height"]//div[@class="type_pick_mobile"]/i
    Wait Until Page Contains Element    //div[@class="row mobile_fill_height"]//div[@class="type_pick"]/ul/li[contains(.,'${title}')]
    Sleep    5s
    Click Element    //div[@class="row mobile_fill_height"]//div[@class="type_pick"]/ul/li[contains(.,'${title}')]
    Sleep    10s
    # Click Element    //div[@class='card-header clearfix']
    Capture Page Screenshot

Search In Mounth For Mobile
    #月份比較 
    [Arguments]    ${title}
    Wait Until Page Contains Element  //div[@class='card-body']/h5
    Click Element     //div[@class='card-body']/h5
    Sleep    5s
    Mouse Over    //div[@class='selectDate_Click']
    Wait Until Page Contains Element    //div[@class='select_month']/select
    Select From List By Value    //div[@class='select_month']/select    ${title}
    Sleep    5s
    Capture Page Screenshot


# 圖表

Check Chart By Option
    @{elements}    Set Variable    1    2    3    4    5
    :FOR    ${i}    IN    @{elements}
    \    Select From List By Value    //select[@class='form-control noborder']    ${i}
    \    Sleep    10s
    \    Click Element    //div[@class='trendIcon icon-Circles ml-4 mt-4']
    \    Sleep  5s
    \    Capture Page Screenshot

Check Chart In Mobile
    [Documentation]    Check Dashboard Chart in button
    [Arguments]    ${title}
    Click Element    //div[@class='row show_991']/div/div/div/button[contains(.,'${title}')]
    Click Element    //div[@class='trendIcon icon-Circles ml-4 mt-4']
    Sleep  5s
    Capture Page Screenshot
    Execute JavaScript    window.document.documentElement.scrollTop = 700;
    Sleep  5s
    # 點選第一類
    Wait Until Page Contains Element    //table[@class='table dataTable']//tbody/tr[1]/td/a/i
    Click Element  //table[@class='table dataTable']//tbody/tr[1]/td/a/i
    Sleep  5s
    Wait Until Page Contains Element    //table[@class='table table-hover']//tbody/tr[1]/td/div
    Click Element    //table[@class='table table-hover']//tbody/tr[1]/td/div
    Sleep  3s
    Click Element    //table[@class='table table-hover']//tbody/tr[2]/td/div
    Execute JavaScript    window.document.documentElement.scrollTop = 350;
    Sleep  5s
    Capture Page Screenshot
    # 圖表放大
    Click Element    //div[@class='barIcon icon-Circles ml-3 mt-4']/i[@class='ion ion-android-open']
    Sleep  3s
    Capture Page Screenshot
    Click Element    //div[@id='chart']/div/i
    # 長條圖
    Click Element    //div[@class='barIcon icon-Circles ml-3 mt-4']/i[@class='fa fa-bar-chart']
    Sleep  3s
    Capture Page Screenshot

    Check Chart By Option
    # Chart Transform

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

    
