#Created By Mark Ticzon
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

driver = webdriver.Chrome()
driver.get("http://localhost:8080/")
login = driver.find_element_by_id("login")
login.click()
driver.save_screenshot('Logged In/Valid/login.png')
username = driver.find_element_by_id("username")
username.send_keys('Testing')
driver.save_screenshot('Logged In/Valid/inputUsername.png')
password = driver.find_element_by_id("password")
password.send_keys('May2019')
driver.save_screenshot('Logged In/Valid/inputPassword.png')
btnLogin = driver.find_element_by_id("login")
btnLogin.click()
driver.save_screenshot('Logged In/Valid/LoggedIn.png')
type = driver.find_element_by_id("search")
type.send_keys('Test post blog')
driver.save_screenshot('Logged In/Valid/SearchResult.png')

#Clear Button
clr = driver.find_element_by_id("clear-btn")
clr.click()
driver.save_screenshot('Logged In/Valid/Clear_Valid.png')
#Created By Mark Ticzon
