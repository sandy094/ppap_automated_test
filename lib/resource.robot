*** Settings ***
Library    Selenium2Library
Library    OperatingSystem
Library    String



*** Variables ***
${SERVER}    ppap.pmzoe.com/login
${BROWSER}    Chrome
${DELAY}    0
${VALID_USER}    TEST1234  
${VALID_PASSWORD}    123456
${LOGIN URL}    https://${SERVER}/
${WELCOME URL}    https://${SERVER}/welcome.html
${ERROR URL}    https://${SERVER}/error.html





# ppap.pmzoe.com/login
# brdemos
# 111116
# TEST1234
# ppap.losade.info/login
# user1
# brPM
# cj;6u.4u.4