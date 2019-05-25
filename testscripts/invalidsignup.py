# MADE BY MICHELLE MALIXI

from selenium import webdriver
from selenium.webdriver.common.keys import Keys

browser = webdriver.Chrome()
browser.get("localhost:8080/")

# Add screenshot for initial output
browser.save_screenshot("invalidsignup-first.png")

# Navigate to Sign Up page
signup = browser.find_element_by_id("signup")
signup.click()

browser.save_screenshot("invalidsignup-second.png")

username = browser.find_element_by_id("username")
password = browser.find_element_by_id("password")
repeatpassword = browser.find_element_by_id("repeatpassword")

# Fill out fields with non matching passwords

username.send_keys("mark")
password.send_keys("password01")
repeatpassword.send_keys("randompassword")

registerbtn = browser.find_element_by_id("register")
registerbtn.click()

# Add screenshot for final output

browser.save_screenshot("invalidsignup-final.png")

# MADE BY MICHELLE MALIXI
