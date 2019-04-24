*** Keyword ***
Check Account Page 
    [Documentation]    Check Account Page
    [Arguments]    ${account}    ${password}
    Input Account    ${account}
    Input Password    ${password}

Check Chart In Four card
    # 存提差額
    Page Should Contain Element    //div[@id='differenceAmount']
    Click Element    //div[@id='differenceAmount']
    Page Should Contain Element    //ba-card[@id='differenceAmountContent']//canvas
    Click Element  //div[@id='differenceAmount']
    # 取款總額
    Page Should Contain Element    //div[@id='withdrawAmount']
    Click Element    //div[@id='withdrawAmount']
    Page Should Contain Element    //ba-card[@id='withdrawAmountContent']//canvas
    Click Element  //div[@id='withdrawAmount']
    # 存款總額
    Page Should Contain Element    //div[@id='depositAmount']
    Click Element  //div[@id='depositAmount']
    Page Should Contain Element    //ba-card[@id='depositAmountContent']//canvas
    Click Element  //div[@id='depositAmount']
    # 首存總額
    Page Should Contain Element    //div[@id='firstDepositAmount']
    Click Element  //div[@id='firstDepositAmount']
    Sleep    3s
    Page Should Contain Element    //ba-card[@id='firstDepositAmountContent']//canvas
    Click Element  //div[@id='firstDepositAmount']


Count In Seven Days For yesterday Mobile
    @{cards}    Set Variable    firstDepositAmount    depositAmount    withdrawAmount    differenceAmount    
    :FOR    ${card}    IN    @{cards}
    \    Execute JavaScript  window.document.documentElement.scrollTop = 0;
    \    Page Should Contain Element    //div[@id='${card}']
    \    Click Element    //div[@id='${card}']
    \    Wait Until Page Contains Element   //ba-card[@id='${card}Content']//button[@id='sortMenu']
    \    Click Element    //ba-card[@id='${card}Content']//button[@id='sortMenu']
    \    Click Element    //ba-card[@id='${card}Content']//a[contains(.,"以时合计")]
    \    Sleep    5s
    \    Page Should Contain Element    //ba-card[@id='${card}Content']//canvas
    \    Capture Page Screenshot
    \    Click Element    //ba-card[@id='${card}Content']//button[@id='sortMenu']
    \    Click Element    //ba-card[@id='${card}Content']//a[contains(.,"以日合计")]
    \    Sleep    5s
    \    Page Should Contain Element    //ba-card[@id='${card}Content']//canvas
    \    Capture Page Screenshot
    \    Click Element    //div[@id='${card}']

Count In A Day For week Mobile
    @{cards}    Set Variable    firstDepositAmount    depositAmount    withdrawAmount    differenceAmount    
    :FOR    ${card}    IN    @{cards}
    \    Execute JavaScript  window.document.documentElement.scrollTop = 0;
    \    Page Should Contain Element    //div[@id='${card}']
    \    Click Element    //div[@id='${card}']
    \    Click Element    //ba-card[@id='${card}Content']//button[@id='sortMenu']
    \    Click Element    //ba-card[@id='${card}Content']//a[contains(.,"以周合计")]
    \    Sleep    5s
    \    Page Should Contain Element    //ba-card[@id='${card}Content']//canvas
    \    Capture Page Screenshot
    \    Click Element    //div[@id='${card}']

Count In A Day For months Mobile
     @{cards}    Set Variable    firstDepositAmount    depositAmount    withdrawAmount    differenceAmount    
    :FOR    ${card}    IN    @{cards}
    \    Execute JavaScript  window.document.documentElement.scrollTop = 0;
    \    Page Should Contain Element    //div[@id='${card}']
    \    Click Element    //div[@id='${card}']
    \    Click Element    //ba-card[@id='${card}Content']//button[@id='sortMenu']
    \    Wait Until Page Contains Element  //ba-card[@id='${card}Content']//a[contains(.,"以周合计")]
    \    Click Element    //ba-card[@id='${card}Content']//a[contains(.,"以周合计")]
    \    Sleep    5s
    \    Page Should Contain Element    //ba-card[@id='${card}Content']//canvas
    \    Capture Page Screenshot
    \    Click Element    //ba-card[@id='${card}Content']//button[@id='sortMenu']
    \    Wait Until Page Contains Element  //ba-card[@id='${card}Content']//a[contains(.,"以月合计")]
    \    Click Element    //ba-card[@id='${card}Content']//a[contains(.,"以月合计")]
    \    Sleep    5s
    \    Page Should Contain Element    //ba-card[@id='${card}Content']//canvas
    \    Capture Page Screenshot
    \    Click Element    //div[@id='${card}']

Quick Search In Mobile For Dashboard
    [Documentation]    Click Time Search In Quick Search To Search
    [Arguments]    ${title}    
    Wait Until Page Contains Element   //div[@class='baDateform btn-group']/a[contains(.,'${title}')]  
    Click Link    //div[@class='baDateform btn-group']/a[contains(.,'${title}')] 
    Page Should Contain Element    //div[@class='pie-chart-item']    limit=4
    Sleep    5s
    Capture Page Screenshot

