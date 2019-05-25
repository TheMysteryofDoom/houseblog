from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import TimeoutException
import random
import string
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

def random_string(length):
    pool = string.ascii_letters + string.digits
    return ''.join(random.choice(pool) for i in range(length))

def signup(driver, newUser, randString):
    username = driver.find_element_by_id("username")
    password = driver.find_element_by_id("password")
    passwordR = driver.find_element_by_id("repeatpassword")
    elem = driver.find_element_by_id("register")
    username.send_keys(newUser)
    password.send_keys(randString)
    passwordR.send_keys(randString)
    elem.click()

driver = webdriver.Firefox()
driver.get("http://localhost:8080/signup")

# Loop starts here.

randString = random_string(7)
newUser = "AUTO-"+randString
signup(driver, newUser, randString)

elemhere = True;
try:
    try:
        element = WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.ID, "login"))
        )
    finally:
        print("====Login====")
    driver.find_element_by_id("login")
except NoSuchElementException:
    elemhere = False
except TimeoutException:
    elemhere = False

if elemhere:
    print("New User:", newUser)
    print("Password for",newUser,":", randString)
    try:
        element = WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.ID, "home"))
        )
    finally:
        print("====Home====")
    home = driver.find_element_by_id("home")
    home.click()
    try:
        element = WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.ID, "signup"))
        )
    finally:
        print("====Signup====")
    signup = driver.find_element_by_id("signup")
    signup.click()
    print("Signup should be clicked")
else:
    print("Error: No User was created.")
