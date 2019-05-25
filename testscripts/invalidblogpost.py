#This was made by Greg Marvin T. Cabrera
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

driver = webdriver.Chrome()
driver.get("http://localhost:8080")

driver.find_element_by_id("login").click()

driver.save_screenshot("login_screenshot.png")

# elements
name = driver.find_element_by_id("username")
password = driver.find_element_by_id("password")
login = driver.find_element_by_id("login")

name.clear()
password.clear()

name.send_keys("greg")
password.send_keys("password01")

driver.save_screenshot("login_credentials_screenshot.png")
login.click()

driver.save_screenshot("homepage_screenshot.png")

driver.find_element_by_id("post").click()

driver.save_screenshot("invalid_blog_post_screenshot.png")
#This was made by Greg Marvin T. Cabrera