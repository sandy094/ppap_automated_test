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
    Wait Until Page Contains Element    //div[@class='auth-block']/form/div/div/button[contains(.,'E-mail ')]
    Click Element    //div[@class='auth-block']/form/div/div/button[contains(.,'E-mail ')]
    Sleep    1.5m

Check sidebar link Game Information navigation is correct
    # 關掉公告訊息提示
    # Wait Until Page Contains Element    //div[@class='container bg-white boss-know-panel']//button[1]
    # Click Element  //div[@class='container bg-white boss-know-panel']//button[1]
    Click Sidebar Link    对帐资讯
    Sleep   2s
    Wait Until Page Contains Element    //li[@title="站台"] /a[contains(.,'站台')]
    Click Element    //li[@title="站台"] /a[contains(.,'站台')]
    Sleep  2s
    Wait Until Page Contains Element    //li[@title="站台"] /ul//li[contains(.,'对帐查询')]
    Click Element    //li[@title="站台"] /ul//li[contains(.,'对帐查询')]
    Sleep  5s
    Capture Page Screenshot

Click Quick Search
    @{gameSites}    Set Variable     5    6  7  8  9  10    
    :FOR  ${gameSite}  IN  @{gameSites}
    \  Sleep    10s
    \  Wait Until Page Contains Element    //ss-multiselect-dropdown/div/button
    \  Click Element    //ss-multiselect-dropdown/div/button
    \  Sleep    5s
    \  Wait Until Page Contains Element    //ss-multiselect-dropdown//div[@class='dropdown-menu']/a[${gameSite}]
    \  Click Element    //ss-multiselect-dropdown//div[@class='dropdown-menu']/a[${gameSite}]
    \  Sleep    5s
    \  Wait Until Page Contains Element    //div[@class='site-header']/div/div/label/span[contains(.,'最新资料')]
    \  Click Element    //div[@class='site-header']/div/div/label/span[contains(.,'最新资料')]
    \  Sleep    5s
    \  Wait Until Page Contains Element    //div[@class='site-header']/div/div/label/input[@ng-reflect-model='true']
    \  Wait Until Page Contains Element    //table[@id='siteReport']/tbody/tr[1]/td[6][contains(.,' +备注 ')]
    \  Wait Until Page Contains Element    //div[@class='site-header']/div/div/button[contains(.,'储存 ')]
    \  Click Element    //div[@class='site-header']/div/div/button[contains(.,'储存 ')]
    \  Sleep    2s
    \  Wait Until Page Contains Element    //div[@class='modal-content']//div/div[contains(.,' 储存完成 ')]
    \  Capture Page Screenshot
    \  Wait Until Page Contains Element    //div[@class='modal-content']//div[@class='modal-footer']/button[contains(.,'确定')]
    \  Click Element    //div[@class='modal-content']//div[@class='modal-footer']/button[contains(.,'确定')]
    \  Reload Page


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
