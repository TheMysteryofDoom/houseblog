#Created By Mark Ticzon
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

driver = webdriver.Chrome()
driver.get("http://localhost:8080/")
driver.save_screenshot('Logged Out/InvalidSearchIndex.png')
type = driver.find_element_by_id("search")
clr = driver.find_element_by_id("clear-btn")

type.send_keys('  ')
#items = 10
#for i in range(items):
#    type.clear()
#    type.send_keys('Search'+str(i))
#    clr.click()
#    driver.save_screenshot('clr'+ str(i) +'.jpg')
#    driver.save_screenshot('search'+ str(i) +'.jpg')

driver.save_screenshot('Logged Out/InvalidSearchResult.png')
time.sleep(2)
clr.click()
driver.save_screenshot('Logged Out/ClrInValidSearch.png')
#Created By Mark Ticzon
