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
    Page Should Contain Element    //div[@class='dashboss_card_value_container_piechart']    limit=4
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





