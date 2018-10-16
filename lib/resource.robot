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
${LOGIN URL}    http://${SERVER}/
${WELCOME URL}    http://${SERVER}/welcome.html
${ERROR URL}    http://${SERVER}/error.html



# ppap.pmzoe.com/login
# brdemo
# TEST1234
# ppap.losade.info/login
# user1