from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import random
import string
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# This test case is only ran once as it is intended for it to have its number of iterations decided by a bigger test suite.

def random_string(length):
    pool = string.ascii_letters + string.digits
    return ''.join(random.choice(pool) for i in range(length))

driver = webdriver.Firefox()
driver.get("http://localhost:8080/login")

username = driver.find_element_by_id("username")
password = driver.find_element_by_id("password")
elem = driver.find_element_by_id("login")

username.send_keys("nolandev")
password.send_keys("nolandev")

elem.click()
try:
    element = WebDriverWait(driver, 10).until(
        EC.presence_of_element_located((By.ID, "myblogs"))
    )
finally:
    print("====1====")

link = driver.find_element_by_id('myblogs')
link.click()

try:
    element = WebDriverWait(driver, 10).until(
        EC.presence_of_element_located((By.ID, "editbutton"))
    )
finally:
    print("====2====")

link = driver.find_element_by_id('editbutton')
link.click()

title = driver.find_element_by_id("title")
content = driver.find_element_by_id("content")
submit = driver.find_element_by_id("submit")

title.clear()
content.clear()

autoblog = "AUTOEDIT-"+random_string(8)
title.send_keys(autoblog)
content.send_keys(random_string(40))
submit.click()
