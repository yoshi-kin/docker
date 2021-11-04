# -*- coding: utf-8 -*-
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import chromedriver_binary

options = Options()
# ヘッドレスモード（Linux上で動かすとき必ずこのモードにしておく）
options.add_argument('--headless')
options.add_argument('--no-sandbox')
options.add_experimental_option('excludeSwitches', ['enable-logging'])
driver = webdriver.Chrome(options=options)
driver.get('https://example.com')
print(driver.current_url)

driver.quit()
