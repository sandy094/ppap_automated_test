*** Settings ***
Force Tags    Login
Suite Setup    SuiteSetup
Suite Teardown    SuiteTeardown
Resource    ../lib/resource.robot
Resource    ../keyword/keyword_common.robot
Resource    ../keyword_paymentinfo/keyword_paymentinfo_gamehall.robot

*** Test Cases ***
Check login
    Login Page    ${VALID_USER}    ${VALID_PASSWORD}

Check sidebar link Game Information navigation is correct
    Close Announcement 
    Click Sidebar Link    对帐中心
    Sleep    5s
    Check Game Information Link    投注查询
    
Click GameHall Search
    Click Element    //div[@class='filter-type filter-type-game']/div/span[contains(.,'娱乐城查询')]
    Sleep    5s
    Wait Until Element Is Visible    //div[@class='accordion']/div
    ${elementCounts}=  Get Element Count    //div[@class='accordion']/div
    ${elementCounts}=  Convert To Integer    ${elementCounts}
    ${elementCounts}=  Evaluate   ${elementCounts}+1
    :FOR  ${gamehall}  IN RANGE  1    ${elementCounts}  
    \    Wait Until Element Is Visible    //div[@class='accordion']/div[${gamehall}]
    \    Click Element    //div[@class='accordion']/div[${gamehall}]/label/div
    \    Click Element    //div[@class='col-12 NAVlist']//div/button[contains(.,' 查询 ')]
    \    Sleep    5s
    \    Capture Page Screenshot
    \    Should Not Be Empty    //ng2-smart-table[@class='gamehall__tb']/table/tbody/tr/td[2]
    \    ${hallPayoffsums}=  Get Text   //ng2-smart-table[@class='gamehall__tb']/table/tbody/tr/td[2]
    \    ${hallName}=  Get Text    //h3[@id='h3']
    \    Click Element    //div[@class='filter-type filter-type-game']/div/span[contains(.,'娱乐城查询')]








      


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
