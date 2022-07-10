from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time
s=Service('C:\Program Files (x86)\chromedriver.exe')
browser = webdriver.Chrome(service=s)

username = "alex.gibon"
password = "Wow#jesus0217"
url='https://baas.acronis.com/login'

#enter username + enter
browser.get(url)
GetElemByXpath = browser.find_element(By.XPATH, "/html/body/div[1]/section/section/main/div/div/div/div/div[6]/form/div[3]/div/div[1]/div/div/input") 
GetElemByXpath.send_keys(username)
GetElemByXpath.send_keys(Keys.RETURN)
time.sleep(1)


#enter password + enter
GetElemByXpath2 = browser.find_element(By.XPATH, "/html/body/div[1]/section/section/main/div/div/div/div/div[6]/form[1]/div[3]/div/div[1]/div/div[1]/div/div[1]/input")
GetElemByXpath2.send_keys(password)
GetElemByXpath2.send_keys(Keys.RETURN)
