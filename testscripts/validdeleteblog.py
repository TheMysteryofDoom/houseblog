# MADE BY MICHELLE MALIXI

from selenium import webdriver
from selenium.webdriver.common.keys import Keys

 # change based on browser used
driver = webdriver.Chrome()
driver.get("localhost:8080/")

# Navigate to Login page
login = driver.find_element_by_id("login")
login.click()

# Screenshot 1
driver.save_screenshot("validdeleteblog-first.png")

username = driver.find_element_by_id("username")
password = driver.find_element_by_id("password")

username.send_keys("mark")
password.send_keys("password01")

# Screenshot 2
driver.save_screenshot("validdeleteblog-second.png")

loginBtn = driver.find_element_by_id("login")
loginBtn.click()

# Redirect to Home Page
myblogs = driver.find_element_by_id("myblogs")
myblogs.click()

# Screenshot 3
driver.save_screenshot("validdeleteblog-third.png")

deletebtn = driver.find_element_by_id("deletebutton")
deletebtn.click()

# Final Screenshot
driver.save_screenshot("validdeleteblog-final.png")

# MADE BY MICHELLE MALIXI
