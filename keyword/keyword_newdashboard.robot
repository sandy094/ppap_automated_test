*** Keyword ***
Check Account Page 
    [Documentation]    Check Account Page
    [Arguments]    ${account}    ${password}
    Input Account    ${account}
    Input Password    ${password}

Check Topbar Link
    [Arguments]    ${title}
    Click Element    //li/a[contains(.,'${title}')]

Verify Page Title Is Correct
    [Documentation]    Verify page title is match sidebar link and match
    [Arguments]    ${title}
    Wait Until Page Contains Element    //div[@class="page-top clearfix"]/ba-content-top/div/ul/li[contains(.,'${title}')]
    Click Element    //div[@class="page-top clearfix"]/ba-content-top/div/ul/li[contains(.,'${title}')]

Verify Basic Table Is Active
    # 逐日列表 標題
    
    ${titleA}=  Get Text  //ng2-smart-table[@class='frozen_1']/table/thead/tr[1]/th[2]//span
    Should Be True  '${titleA}'=='活跃会员'

    ${titleB}=  Get Text  //ng2-smart-table[@class='frozen_1']/table/thead/tr[1]/th[3]//span
    Should Be True  '${titleB}'=='损益'

    ${titleC}=  Get Text  //ng2-smart-table[@class='frozen_1']/table/thead/tr[1]/th[4]//span
    Should Be True  '${titleC}'=='有效投注'

    ${titleD}=  Get Text  //ng2-smart-table[@class='frozen_1']/table/thead/tr[1]/th[5]//span
    Should Be True  '${titleD}'=='营收比'

    ${titleE}=  Get Text  //ng2-smart-table[@class='frozen_1']/table/thead/tr[1]/th[6]//span
    Should Be True  '${titleE}'=='投注单量'

     # 逐日列表 數值是否顯示正常
    @{values}  Set Variable  2  3  4  6 
    :FOR  ${value}  IN  @{values}
    \  Wait Until Page Contains Element  //ng2-smart-table[@class='frozen_1']/table/tbody/tr[1]/td[${value}]//span
    \  ${B}=  Get Text  //ng2-smart-table[@class='frozen_1']/table/tbody/tr[1]/td[${value}]//span
    \  Should Not Be Empty  ${B}

    ${C}=  Get Text  //ng2-smart-table[@class='frozen_1']/table/tbody/tr[1]/td[5]//span
    Should Not Be Empty  ${C}

Verify Basic Information Table Is Active
    Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,'运营 ')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'活跃会员')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'损益')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'营收比')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'有效投注')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'投注单量')]
    Page Should Contain Element  //div[@id='barChart']//echarts-ng2//canvas

    @{elements}  Set Variable  活跃会员  损益  营收比  有效投注  投注单量
    :FOR  ${element}  IN  @{elements}
    \  Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,'运营 ')]
    \  Click Element  //div[@class="allData-item"]/span[contains(.,'${element}')]
    \  Sleep  5s
    \  Page Should Contain Element  //div[@id="barChart"]/div[contains(.,'${element}')] 
    \  Capture Page Screenshot

Verify SiteRank Value For Basic 
# 待修改
    Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,'站台 ')]
    Wait Until Page Contains Element  //div[@class="kanban-title"]/div/a/a
    Click Element  //div[@class="kanban-title"]/div/a/a
    @{number}  Set variable  3  4  5  6  7  8
    :FOR  ${num}  IN  @{number}
    \  ${Values}=  Get Text  //ng2-smart-table[@id="siteRank"]/table/tbody/tr[1]/td[${num}]
    \  Should Not Be Empty  ${Values}

    Capture Page Screenshot


Verify Basic Table For Years
    # 逐日列表 標題
    ${titleB}=  Get Text  //ng2-smart-table[@class='frozen_1']/table/thead/tr[1]/th[3]//span
    Should Be True  '${titleB}'=='损益'

    ${titleC}=  Get Text  //ng2-smart-table[@class='frozen_1']/table/thead/tr[1]/th[4]//span
    Should Be True  '${titleC}'=='有效投注'

    ${titleD}=  Get Text  //ng2-smart-table[@class='frozen_1']/table/thead/tr[1]/th[5]//span
    Should Be True  '${titleD}'=='营收比'

    ${titleE}=  Get Text  //ng2-smart-table[@class='frozen_1']/table/thead/tr[1]/th[6]//span
    Should Be True  '${titleE}'=='投注单量'

     # 逐日列表 數值是否顯示正常
    @{values}  Set Variable  2  3  4  6 
    :FOR  ${value}  IN  @{values}
    \  Wait Until Page Contains Element  //ng2-smart-table[@class='frozen_1']/table/tbody/tr[1]/td[${value}]//span
    \  ${B}=  Get Text  //ng2-smart-table[@class='frozen_1']/table/tbody/tr[1]/td[${value}]//span
    \  Should Not Be Empty  ${B}

    ${C}=  Get Text  //ng2-smart-table[@class='frozen_1']/table/tbody/tr[1]/td[5]//span
    Should Not Be Empty  ${C}

Verify Basic Information Table For Years
    Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,'运营 ')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'损益')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'营收比')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'有效投注')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'投注单量')]
    Page Should Contain Element  //div[@id='barChart']//echarts-ng2//canvas

    @{elements}  Set Variable  活跃会员  损益  营收比  有效投注  投注单量
    :FOR  ${element}  IN  @{elements}
    \  Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,'运营 ')]
    \  Click Element  //div[@class="allData-item"]/span[contains(.,'${element}')]
    \  Sleep  5s
    \  Page Should Contain Element  //div[@id="barChart"]/div[contains(.,'${element}')] 
    \  Capture Page Screenshot

    Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,'运营 ')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'损益')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'营收比')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'有效投注')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'投注单量')]
    Page Should Contain Element  //div[@id='barChart']//echarts-ng2//canvas

    @{elements}  Set Variable  损益  营收比  有效投注  投注单量
    :FOR  ${element}  IN  @{elements}
    \  Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,'运营 ')]
    \  Click Element  //div[@class="allData-item"]/span[contains(.,'${element}')]
    \  Sleep  5s
    \  Page Should Contain Element  //div[@id="barChart"]/div[contains(.,'${element}')] 
    \  Capture Page Screenshot


Verify Save Information Table Is Active
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'存款总额')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'首存总额')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'取款总额')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'存提差额')]

    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'活跃会员')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'损益')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'营收比')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'有效投注')]
    Page Should Contain Element  //div[@class="allData-item"]/span[contains(.,'投注单量')]
    Page Should Contain Element  //div[@id='barChart']//echarts-ng2//canvas
    # change chart
    @{elements}  Set Variable  存款总额  首存总额  取款总额  存提差额  活跃会员  损益  营收比  有效投注  投注单量
    :FOR  ${element}  IN  @{elements}
    \  Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,'运营 ')]
    \  Click Element  //div[@class="allData-item"]/span[contains(.,'${element}')]
    \  Sleep  5s
    \  Page Should Contain Element  //div[@id="barChart"]/div[contains(.,'${element}')] 
    \  Capture Page Screenshot

Verify Save Table Is Active
    # 存提-逐日列表 標題
    [Documentation]  check 'save'?table is active
    Wait Until Page Contains Element  //ng2-smart-table[@class='frozen_1']/table/thead/tr[1]/th[2]//span
    ${titleA}=  Get Text  //ng2-smart-table[@class='frozen_1']/table/thead/tr[1]/th[2]//span
    Should Be True  '${titleA}'=='首存总额'
    ${titleB}=  Get Text  //ng2-smart-table[@class='frozen_1']/table/thead/tr[1]/th[3]//span
    Should Be True  '${titleB}'=='存款总额'
    ${titleC}=  Get Text  //ng2-smart-table[@class='frozen_1']/table/thead/tr[1]/th[4]//span
    Should Be True  '${titleC}'=='取款总额'
    ${titleD}=  Get Text  //ng2-smart-table[@class='frozen_1']/table/thead/tr[1]/th[5]//span
    Should Be True  '${titleD}'=='存提差额'

    # 存提-逐日列表 數值是否顯示正常
    @{values}  Set Variable  2  3  4  5  6  7 
    :FOR  ${value}  IN  @{values}
    \  Wait Until Page Contains Element  //ng2-smart-table[@class='frozen_1']/table/tbody/tr[1]/td[${value}]//span
    \  Sleep  5s
    \  ${B}=  Get Text  //ng2-smart-table[@class='frozen_1']/table/tbody/tr[1]/td[${value}]//span
    \  Should Not Be Empty  ${B}

Verify Save Page Is Active
    Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,' 逐日 ')]
    Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,'存提 ')]
    Sleep  10s
    Verify Save Table Is Active
    Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,'运营 ')]
    Verify Save Information Table Is Active
    Capture Page Screenshot
    Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,'站台 ')]
    Page Should Contain Element  //div[@id="rankTable"]
    # 驗證是否有值
    ${TEST}=  Get Text  //div[@id="rankTable"]/table//tr[1]/td[2]
    Should Not Be Empty  ${TEST}
    Verify SiteRank Value For Save 
    Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,'游戏 ')]
    Capture Page Screenshot

    Reload Page



Verify SiteRank Value For Save 
    Click Element  //div[@class="header-link-bar text-center"]/a[contains(.,'站台 ')]
    Wait Until Page Contains Element  //div[@class="kanban-title"]/div/a/a
    Click Element  //div[@class="kanban-title"]/div/a/a
    @{number}  Set variable  3  4  5  6  7  8  9   10  11  12
    :FOR  ${num}  IN  @{number}
    \  ${Values}=  Get Text  //ng2-smart-table[@id="siteRank"]/table/tbody/tr[1]/td[${num}]
    \  Should Not Be Empty  ${Values}

    Capture Page Screenshot

# 圖表
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

List In Right Way
    @{categorys}    Set Variable    机率    视讯    体育    棋牌    彩票
    :FOR    ${category}    IN    @{categorys}
    \    Wait Until Page Contains Element    //div[@class="table-responsive"]//tr[contains(.,"${category}")]
    \    Sleep    8s
    \    Click Element    //div[@class="table-responsive"]//td[contains(.,"${category}")]
    \    Sleep    5s
    \    Page Should Contain Element    //table[@class='table dataTable']
    \    Chart Transform
    