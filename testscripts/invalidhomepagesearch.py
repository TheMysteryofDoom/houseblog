#Created By Mark Ticzon
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

driver = webdriver.Chrome()
driver.get("http://localhost:8080/")
login = driver.find_element_by_id("login")
login.click()
driver.save_screenshot('Logged In/Invalid/invalidSearchLogin.png')
username = driver.find_element_by_id("username")
username.send_keys('Testing')
driver.save_screenshot('Logged In/Invalid/invalidSearchInputUsername.png')
password = driver.find_element_by_id("password")
password.send_keys('May2019')
driver.save_screenshot('Logged In/Invalid/invalidSeaarchInputPassword.png')
btnLogin = driver.find_element_by_id("login")
btnLogin.click()
driver.save_screenshot('Logged In/Invalid/invalidSearchLoggedIn.png')
type = driver.find_element_by_id("search")
type.send_keys('  ')
driver.save_screenshot('Logged In/Invalid/invalidSearchResult.png')

#Clear Button
clr = driver.find_element_by_id("clear-btn")
clr.click()
driver.save_screenshot('Logged In/Invalid/Clear.png')

#Created By Mark Ticzon
