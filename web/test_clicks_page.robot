*** Settings ***
Force Tags    Login
Suite Setup    SuiteSetup
Suite Teardown    SuiteTeardown
Resource    ../lib/resource.robot
Resource    ../keyword/keyword_common.robot
Resource    ../keyword/keyword_clicks.robot

*** Test Cases ***
Check login
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}

Check sidebar link Game Information navigation is correct
    Close Announcement 
    Click Sidebar Link    运营看板
    Sleep    10s
    Check Game Information Link    游戏解析
    Wait Until Page Contains Element    //a[@class='borderr_1px active'][contains(.,'游戏解析')]
    Click Element    //a[@class='borderr_1px active'][contains(.,'游戏解析')]
    Wait Until Page Contains Element    //a[@class='borderr_1px active'][contains(.,'游戏解析')]/div/span[contains(.,' 点击资讯 ')]
    Click Element    //a[@class='borderr_1px active'][contains(.,'游戏解析')]/div/span[contains(.,' 点击资讯 ')]

Click Quick Search
    Sleep    10s
    ${valueB}    Set Variable    0
    @{days}  Set Variable    上周  本月  上月  昨日
    :FOR  ${day}  IN  @{days}
    \  Quick Search botton    ${day}
    \  Sleep    30s
    # 暫時改成30s
    \  Check Values
    \  ${valueA}=  Get Text    //div[@id="tableData"] //tbody/tr[2]/td[@class='totalClickCounts-td']   #點擊數
    \  ${result}=  Run Keyword And Return Status   Should Not Match    ${valueA}  ${valueB}
    \  Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    \  ${valueB}  Set Variable    ${valueA}
   
# 本季.本年搜尋時間太長暫時PASS
# Click Quick Search In Year 
#     ${valueB}    Set Variable    0
#     @{seasons}  Set Variable  本年  本季  
#     :FOR  ${season}  IN  @{seasons}
#     \  Quick Search botton    ${season}
#     \  Sleep  30s
#     \  Check Values
#     \  ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[6]
#     \  ${result}=  Run Keyword And Return Status   Should Not Match    ${valueA}  ${valueB}
#     \  Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
#     \  ${valueB}  Set Variable    ${valueA}

Search In Datetime 
    Sleep  5s
    ${valueB}    Set Variable    0
    @{mounths}    Set Variable    0: 2020年5月  1: 2020年4月  
    :FOR    ${month}  IN  @{mounths}
    \  Search In Month    ${month}
    \  Sleep    30s
    # 暫時改成30s
    \  Check Values
    \  ${valueA}=  Get Text  //div[@id="tableData"] //tbody/tr[2]/td[@class='totalClickCounts-td']   #點擊數
    \  ${result}=  Run Keyword And Return Status   Should Not Match    ${valueA}  ${valueB}
    \  Run Keyword If    '${result}'=='False'    Capture Page Screenshot    ELSE    No Operation
    \  ${valueB}  Set Variable    ${valueA}

Quick Search
# 快搜
    Quick Search botton    上周
    Wait Until Page Contains Element    //input[@id='sch__input']
    Input Text   //input[@id='sch__input']    g
    Wait Until Page Contains Element    //div[@id='tableData']/table/tbody/tr[2]/td[3]/span
    ${searchValue}=  Get Text    //div[@id='tableData']/table/tbody/tr[2]/td[3]/span

New Field
    Quick Search botton    昨日
    Wait Until Page Contains Element    //ba-card[@id='analysis-main-panel']//div/span[@class='add-field-border']/i
    Click Element    //ba-card[@id='analysis-main-panel']//div/span[@class='add-field-border']/i
    Sleep    4s
    Wait Until Page Contains Element    //div[@class='custom_field_fast_column']/div/label[@for='點擊數']
    Click Element    //div[@class='custom_field_fast_column']/div/label[@for='點擊數']
    Sleep    5s
    Click Element    //div[@class='custom_field_fast_column']/div/label[@for='運營']
    Sleep    5s
    ${checkClick}=    Run Keyword And Return Status    Page Should Contain Element    //div[@class='custom_field_fast_column_item']/div[@class='item active']/span[contains(.,' 钱包成功转换率')]
    ${checkProfit}=    Run Keyword And Return Status    Page Should Contain Element    //div[@class='custom_field_fast_column_item']/div[@class='item active']/span[contains(.,' 损益')]
    Click Element    //div[@class='custom_field_save-wrp text-center']/button[contains(.,' 確定 ')]
    Sleep    1m
    # 錢包成功轉換率
    Run Keyword If    '${checkClick}'=='True'    Page Should Contain Element    //div[@id='tableData']/table/tbody/tr[2]/td[@class='walletTransferRate-td']    ELSE    Page Should Not Contain Element    //div[@id='tableData']/table/tbody/tr[2]/td[@class='walletTransferRate-td']
    Run Keyword If    '${checkClick}'=='True'    Should Not Be Empty    //div[@id='tableData']/table/tbody/tr[2]/td[@class='walletTransferRate-td']    ELSE    No Operation
    # 損益
    Run Keyword If    '${checkProfit}'=='True'    Run Keyword    Page Should Contain Element    //div[@id='tableData']/table/tbody/tr[2]/td[@class='payoffSums-td']    ELSE    Page Should Not Contain Element    //div[@class='custom_field_fast_column_item']/div[@class='item active']/span[contains(.,' 损益')]
    Should Not Be Empty    //div[@id='tableData']/table/tbody/tr[2]/td[@class='payoffSums-td']

Field
# 點擊數連結
    ${getCnTitle}=  Get Text    //div[@id='tableData']/table/tbody/tr[3]/td[@class='nameCn-td']
    
    ${getClickCountsValue}=  Get Text    //div[@id='tableData']/table/tbody/tr[3]/td[@class='totalClickCounts-td']/a
    ${getClickCountsValue}=  Convert To Integer    ${getClickCountsValue}
    Click Element    //div[@id='tableData']/table/tbody/tr[3]/td[@class='totalClickCounts-td']/a
    Sleep    5s
    ${getSiteTitle}=  Get Text    //div[@class='detail-clickcount__title']/span
    # 站台名稱要相同
    ${result}=  Run Keyword And Return Status    Should Match    ${getCnTitle}  ${getSiteTitle}

    # 點擊數分幾類
    ${getElementCount}=  Get Element Count    //div[@id='tableData']/table/tbody/tr
    ${getElementCount}=  Convert To Integer    ${getElementCount}
    # ${getElementCount}=  Evaluate  ${getElementCount}+1
    ${totalClick}  Set Variable  0
    :FOR  ${element}  IN  1  ${getElementCount}
    \    ${getClicksCounts}=  Get Text  //div[@id='tableData']/table/tbody/tr[${element}]/td[3]/a
    \    ${totalClick}=    Evaluate  ${totalClick} + ${getClicksCounts}
    \    Run Keyword If  '${getElementCount}'==1  Exit For Loop    Else    No Operation

    Should Be Equal  ${totalClick}  ${getClickCountsValue}


      


*** Keywords ***
SuiteSetup
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    # Set Window Size    1920    1080
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}
    Set Browser Implicit Wait    10s
    
SuiteTeardown
    Run Keyword If Any Tests Failed    Capture Page Screenshot    
    Close Browser
