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

Increase Field
# 新增欄位
    Execute JavaScript     window.document.documentElement.scrollTop = 850;
    Sleep    2s
    Wait Until Page Contains Element    //div[@class='add-new-field']/span
    Click Element    //div[@class='add-new-field']/span
    Wait Until Page Contains Element    //div[@class='add-new-field']//div/label[contains(.,'有效投注')]
    Click Element    //div[@class='add-new-field']//div/label[contains(.,'有效投注')]
    Click Element    //div[@class='add-new-field']//div/label[contains(.,'投注单量')]
    Click Element    //div[@class='add-new-field']/span
    Page Should Contain Element    //div[@id='tableData']/table/thead/tr[1]/td[contains(.,'有效投注')]
    Page Should Contain Element    //div[@id='tableData']/table/thead/tr[1]/td[contains(.,'投注单量')]
    Should Not Be Empty    //div[@id='tableData']/table/tbody/tr[1]/td[5]
    Should Not Be Empty    //div[@id='tableData']/table/tbody/tr[1]/td[6]
    Sleep    5s
    Click Element    //div[@class='add-new-field']/span
    Click Element    //div[@class='add-new-field']//div/label[contains(.,'有效投注')]
    Click Element    //div[@class='add-new-field']//div/label[contains(.,'投注单量')]
    Click Element    //div[@class='add-new-field']/span
    
Increase Field For Collection
# 新增欄位 收藏集
    Execute JavaScript     window.document.documentElement.scrollTop = 1000;
    Sleep    2s
    @{fieldName}  Set Variable    推荐排序    推荐点击数    热门排序    热门点击数     一般排序     一般点击数    流失率     留存率     黏着度    评比 
    :FOR  ${name}  IN  @{fieldName}
    \  Sleep    5s
    \  Wait Until Page Contains Element    //div[@class='add-new-field']/span
    \  Click Element    //div[@class='add-new-field']/span
    \  Wait Until Page Contains Element    //div[@class='add-new-field']//div/label[contains(.,'${name}')]
    \   Click Element    //div[@class='add-new-field']//div/label[contains(.,'${name}')]
    \  Click Element    //div[@class='add-new-field']/span
    \  Page Should Contain Element    //div[@id='tableData']/table/thead/tr[1]/td[contains(.,'${name}')]
    \  Should Not Be Empty    //div[@id='tableData']/table/tbody/tr[2]/td[5]
    

Chart Change
# 長條圖.趨勢圖放大
    Wait Until Page Contains Element    //div[@class='icon-Circles-pane']//div/i[@class='fa fa-bar-chart']
    Click Element    //div[@class='icon-Circles-pane']//div/i[@class='fa fa-bar-chart']
    Sleep    2s
    Click Element    //div[@id='rankChartData']
    Capture Page Screenshot
    Wait Until Page Contains Element    //div[@class='icon-Circles-pane']//div/i[@class='ion ion-android-open']
    Click Element    //div[@class='icon-Circles-pane']//div/i[@class='ion ion-android-open']
    Sleep    1s
    Mouse Over    //div[@id='chart']//div[@class='col-12 clearfix']
    Capture Page Screenshot
    Click Element    //div[@class='modal-content']//div[@class='close_btn']

Modularization In Chart
# 排行榜展開下拉選單
    Execute JavaScript     window.document.documentElement.scrollTop = 1000;
    # 點選下拉選單圖示
    Wait Until Page Contains Element    //tr[@id='tr-1']/td/div
    Click Element    //tr[@id='tr-1']/td/div
    Sleep     2s
    Wait Until Page Contains Element    //dashboss-dropdown-selector/div[@class='btn-group dropdown']//button
    Click Element    //dashboss-dropdown-selector/div[@class='btn-group dropdown']//button
    Wait Until Page Contains Element    //div[@class='slidechart']//ul/li[contains(.,'有效投注')]
    Click Element    //div[@class='slidechart']//ul/li[contains(.,'有效投注')]
    Sleep    2s
    Capture Page Screenshot

Search In Seven Day 
# 暫時PASS
    Sleep     5s
    Wait Until Page Contains Element    //ba-date-selector[@class='dashbossDateSelector']/div/div/button[@id='sortMenu']
    Click Element    //ba-date-selector[@class='dashbossDateSelector']/div/div/button[@id='sortMenu']
    Wait Until Page Contains Element    //ba-date-selector[@class='dashbossDateSelector']//ul/li[contains(.,'以日合计')]
    Click Element    //ba-date-selector[@class='dashbossDateSelector']//ul/li[contains(.,'以日合计')]
    Sleep    2s
    Click Element    //div[@id='rankChartData']
    Capture Page Screenshot

