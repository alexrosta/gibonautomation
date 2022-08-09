from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import Select
import time
from selenium.webdriver.chrome.options import Options
chrome_options = Options()
chrome_options.add_argument("--ignore-certificate-errors")
chrome_options.add_argument("--headless")

s = Service("C:\Program Files (x86)\chromedriver.exe")
browser = webdriver.Chrome(service=s,options=chrome_options)


class Check_zyxel:
    def __init__(self):
        # login url and credentials
        self.loginurl = "https://accounts.myzyxel.com/users/sign_in"
        self.deviceurl = "https://portal.myzyxel.com/my/devices"
        self.username = "x"
        self.password = "x"
        self.url_list = [
            "https://portal.myzyxel.com/my/devices/3338633",
            "https://portal.myzyxel.com/my/devices/3336780",
            "https://portal.myzyxel.com/my/devices/1756086",
            "https://portal.myzyxel.com/my/devices/3610519",
            "https://portal.myzyxel.com/my/devices/2226767",
            "https://portal.myzyxel.com/my/devices/3425101",
            "https://portal.myzyxel.com/my/devices/3335434",
            "https://portal.myzyxel.com/my/devices/2859098",
            "https://portal.myzyxel.com/my/devices/3022043",
            "https://portal.myzyxel.com/my/devices/3022133",
            "https://portal.myzyxel.com/my/devices/2946388",
            "https://portal.myzyxel.com/my/devices/2748082",
            "https://portal.myzyxel.com/my/devices/2729226",
            "https://portal.myzyxel.com/my/devices/2725756",
            "https://portal.myzyxel.com/my/devices/2725419",
            "https://portal.myzyxel.com/my/devices/2675427",
            "https://portal.myzyxel.com/my/devices/2115193",
            "https://portal.myzyxel.com/my/devices/761211",
            "https://portal.myzyxel.com/my/devices/2217756",
            "https://portal.myzyxel.com/my/devices/2115385",
        ]

    def login(self):
        browser.get(self.loginurl)
        # browser.set_window_position(-10000,0)
        getuserfield = browser.find_element(By.ID, "user_email")
        getuserfield.send_keys(self.username)
        getpassfield = browser.find_element(By.ID, "user_password")
        getpassfield.send_keys(self.password)
        getpassfield.send_keys(Keys.RETURN)

    def check_status(self):
        f = open("zyxel_output.txt", "w")
        print("Customer | Public IP | Firmware Version | Model")
        for uri in self.url_list:
            browser.get(uri)
            name = browser.find_element(
                By.XPATH, '//*[@id="tabs-1"]/div[1]/table[1]/tbody/tr[1]/td[2]'
            )
            publicip = browser.find_element(
                By.XPATH, '//*[@id="tabs-1"]/div[1]/table[2]/tbody/tr[1]/td[4]'
            )
            versionnumber = browser.find_element(
                By.XPATH, '//*[@id="tabs-1"]/div[1]/table[2]/tbody/tr[1]/td[5]'
            )
            model = browser.find_element(
                By.XPATH, '//*[@id="tabs-1"]/div[1]/table[1]/tbody/tr[1]/td[1]'
            )
            status_txt = f"{name.text} | {publicip.text} | {versionnumber.text} | {model.text}"
            
    
            print(status_txt)
            f = open("zyxel_output.txt", "a")
            f.write(status_txt + "\n")
            f.close()


if __name__ == "__main__":
    Check_zyxel().login()
    Check_zyxel().check_status()
    browser.quit
