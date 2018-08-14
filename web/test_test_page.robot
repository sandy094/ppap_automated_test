***Settings***

Resource  ../keyword/keyword_common.robot

***Test Cases****
from selenium import webdriver
from selenium.webdriver.common.by import by
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as expected_conditions
    driver = webdriver.Chrome()
    driver.get("http://ppap.pmzoe.com/login")
    driver.maximize_window()