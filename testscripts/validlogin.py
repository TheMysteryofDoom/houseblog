from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import string

#Charles Ricky Villarin - SE41

browser = webdriver.Chrome()
browser.get("localhost:8080/login")

username = browser.find_element_by_id("username")
password = browser.find_element_by_id("password")

username.send_keys("mark")
password.send_keys("password01")

browser.save_screenshot('success-validlogin-entering.jpg')

loginbtn = browser.find_element_by_id("login")
loginbtn.click()

browser.save_screenshot('success-validlogin.jpg')
