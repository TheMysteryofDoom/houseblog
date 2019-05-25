# MADE BY MICHELLE MALIXI

from selenium import webdriver
from selenium.webdriver.common.keys import Keys

# change based on browser used
driver = webdriver.Chrome()
driver.get("localhost:8080/")

# Navigate to Login Page
login = driver.find_element_by_id("login")
login.click()

# Screenshot 1

driver.save_screenshot("valideditprofile-first.png")

# Enter credentials

username = driver.find_element_by_id("username")
password = driver.find_element_by_id("password")

username.send_keys("newusername")
password.send_keys("password01")
login = driver.find_element_by_id("login")
login.click()

# Screenshot 2

driver.save_screenshot("valideditprofile-second.png")

# Click on'Profile' link

editprofile = driver.find_element_by_id("editprofile")
editprofile.click()

# Screenshot 3

driver.save_screenshot("valideditprofile-third.png")

# Enter credentials for Profile

oldpassword = driver.find_element_by_name("oldpassword")
newpassword = driver.find_element_by_name("newpassword")
repeatpassword = driver.find_element_by_name("repeatpassword")

oldpassword.send_keys("password01")
newpassword.send_keys("testingpass")
repeatpassword.send_keys("testingpass")

# Screenshot 4
driver.save_screenshot("valideditprofile-fourth.png")

savebtn = driver.find_element_by_id("submit")
savebtn.click()

# Add screenshot for final output

driver.save_screenshot("invalidsignup-final.png")

# MADE BY MICHELLE MALIXI
