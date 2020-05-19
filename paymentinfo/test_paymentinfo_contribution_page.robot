*** Settings ***
Force Tags    Login
Suite Setup    SuiteSetup
Suite Teardown    SuiteTeardown
Resource    ../lib/resource.robot
Resource    ../keyword/keyword_common.robot
Resource    ../keyword_paymentinfo/keyword_paymentinfo_contribution.robot

*** Test Cases ***
Check login
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}

Check sidebar link Game Information navigation is correct
    Close Announcement 
    Click Sidebar Link    对帐中心
    Sleep    5s
    Check Game Information Link    贡献金查询
    
Click GameHall Search
    Click Element    //div[@class='filter-type filter-type-game']/div/span[contains(.,'娱乐城查询')]
    Sleep    5s
    Wait Until Element Is Visible    //div[@class='accordion']/div
    ${elementCounts}=  Get Element Count    //div[@class='accordion']/div
    ${elementCounts}=  Convert To Integer    ${elementCounts}
    ${elementCounts}=  Evaluate   ${elementCounts}+1
    :FOR  ${gamehall}  IN RANGE  1    ${elementCounts}  
    \    Wait Until Element Is Visible    //div[@class='accordion']/div[${gamehall}]
    # 查詢娛樂城
    \    Click Element    //div[@class='accordion']/div[${gamehall}]/label/div
    \    Click Element    //div[@class='col-12 NAVlist']//div/button[contains(.,' 查询 ')]
    \    Sleep    5s
    \    Capture Page Screenshot
    \    ${hallName}=  Get Text    //h3[@id='h3']
    \    Time Quicker
    \    Capture Page Screenshot
    \    Click Element    //div[@class='filter-type filter-type-game']/div/span[contains(.,'娱乐城查询')]
    \    Execute JavaScript  window.document.documentElement.scrollTop = 0;


Open gamehall value
    Execute JavaScript  window.document.documentElement.scrollTop = 0;
    Click Element    //div[@class='filter-type filter-type-game']/div/span[contains(.,'娱乐城查询')]
    Wait Until Element Is Visible    //div[@class='accordion']/div/label[@for='pBB-1']
    Click Element    //div[@class='accordion']/div/label[@for='pBB-1']
    Click Element    //div[@class='col-12 NAVlist']//div/button[contains(.,' 查询 ')]
    Sleep    5s
    Click Element    //div[@class='contribution__card__export__checkbox']/label/span
    Sleep    5s
    Capture Page Screenshot






      


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
