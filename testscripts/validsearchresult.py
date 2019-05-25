#Created By Mark Ticzon
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

driver = webdriver.Chrome()
driver.get("http://localhost:8080/")
driver.save_screenshot('Logged Out/ValidSearchResultIndex.png')
type = driver.find_element_by_id("search")
type.send_keys('Test post blog')
driver.save_screenshot('Logged Out/ValidSearchResult.png')
time.sleep(2)
clr = driver.find_element_by_id("clear-btn")
clr.click()
driver.save_screenshot('Logged Out/ValidSearchClr.png')
#Created By Mark Ticzon
