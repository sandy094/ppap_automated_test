*** Settings ***
Force Tags    Login
Suite Setup    SuiteSetup
Suite Teardown    SuiteTeardown
Resource    ../lib/resource.robot
Resource    ../keyword/keyword_common.robot
Resource    ../keyword/keyword_gamehall.robot

*** Test Cases ***
Check login
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}

Check sidebar link Game Information navigation is correct
     # 關掉公告訊息提示
    Wait Until Page Contains Element    //div[@class='container bg-white boss-know-panel']//button[1]
    Click Element  //div[@class='container bg-white boss-know-panel']//button[1]
    Click Sidebar Link    对帐资讯
    Wait Until Page Contains Element    //li[@title="娱乐城"] /a[contains(.,'娱乐城')]
    Click Element    //li[@title="娱乐城"] /a[contains(.,'娱乐城')]
    Sleep  2s
    Wait Until Page Contains Element    //li[@title="娱乐城"] /ul//li[contains(.,'对帐查询')]
    Click Element    //li[@title="娱乐城"] /ul//li[contains(.,'对帐查询')]
    Sleep  5s

# Click Quick Search
#     @{gameHalls}    Set Variable    BB-1    New MG-41    BG-31    AB-17    CQ9-28
#     :FOR  ${gameHall}  IN  @{gameHalls}
#     \  Wait Until Page Contains Element    //label[@for='${gameHall}']
#     \  Click Element    //label[@for='${gameHall}']
#     \  Sleep    5s
#     \  Wait Until Page Contains Element    //ng2-smart-table[@class='gamehall__tb']//tbody/tr/td[2]
#     \  ${tableValueA}=  Get Text   //ng2-smart-table[@class='gamehall__tb']//tbody/tr/td[2]
#     \  Run Keyword If    '${tableValueA}'=='0'   Capture Page Screenshot    ELSE    No Operation
#     \  Search In Time  
#     \  Search In Year
#     \  Search In Datetime 

Search In Hour And Month 
# 時日分頁待新增
    Quick Search botton    本月
    Wait Until Page Contains Element    //label[@for='BB-1']
    Click Element    //label[@for='BB-1']
    ${tableValueA}=  Get Text  //ng2-smart-table[@class='gamehall__tb']//thead/tr[2]/th[2]
    Wait Until Page Contains Element    //div[@class='DWM_pick_left']/div[@class='DWM_pull']/span[contains(.,'时')]
    Click Element     //div[@class='DWM_pick_left']/div[@class='DWM_pull']/span[contains(.,'时')]
    Wait Until Page Contains Element    //div[@class='DWM_pick_left']/div[@class='DWM_pull']/span/a[@class='active'][contains(.,'时')]
    Sleep    2s
    ${tableValueB}=  Get Text  //ng2-smart-table[@class='gamehall__tb']//thead/tr[2]/th[2]  
    ${result}=    Should Match    ${tableValueA}  ${tableValueB}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot   Else    No Operation
    Wait Until Page Contains Element    //div[@class='DWM_pick_left']/div[@class='DWM_pull']/span[contains(.,'月')]
    Click Element    //div[@class='DWM_pick_left']/div[@class='DWM_pull']/span[contains(.,'月')]
    Wait Until Page Contains Element    //div[@class='DWM_pick_left']/div[@class='DWM_pull']/span/a[@class='active'][contains(.,'月')]
    Sleep    4s
    ${tableValueB}=  Get Text  //ng2-smart-table[@class='gamehall__tb']//thead/tr[2]/th[2]
    ${result}=    Should Match    ${tableValueA}  ${tableValueB}
    Run Keyword If    '${result}'=='False'    Capture Page Screenshot   Else    No Operation

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
