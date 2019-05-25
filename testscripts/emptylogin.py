from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import string

#Charles Ricky Villarin - SE41

driver = webdriver.Chrome()
driver.get("localhost:8080/login")

loginbtn = driver.find_element_by_id("login")
loginbtn.click()

driver.save_screenshot('error-emptylogin.jpg')
