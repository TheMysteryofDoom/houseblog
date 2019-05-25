from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import string

#Charles Ricky Villarin - SE41

driver = webdriver.Chrome()
driver.get("localhost:8080/login")

username = driver.find_element_by_id("username")
password = driver.find_element_by_id("password")

username.send_keys("myusername")
password.send_keys("mypassword")

driver.save_screenshot('error-invalidlogin-input.jpg')

loginbtn = driver.find_element_by_id("login")
loginbtn.click()

driver.save_screenshot('error-invalidlogin.jpg')
