from selenium import webdriver
from selenium.webdriver.common.keys import Keys

driver = webdriver.Chrome()
driver.get("http://localhost:8080")
loginButton = driver.find_element_by_id("login")
loginButton.click()
searchbar = driver.find_element_by_id("username")
searchbar.clear()
searchbar.send_keys("DenDen")
searchbar = driver.find_element_by_id("password")
searchbar.clear()
searchbar.send_keys("thisisdennis")
loginButton = driver.find_element_by_id("login")
loginButton.click()
loginButton = driver.find_element_by_id("logout")
loginButton.click()
