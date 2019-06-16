from selenium.webdriver.chrome.options import Options
import MySQLdb
import requests
from lxml import etree
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

def getPhone():
    conn=MySQLdb.connect(host='localhost',user='root',passwd='123456',db='wyjqz',charset='utf8')
    cur=conn.cursor()
    
    chorme_options=Options()
    chorme_options.add_argument("--headless")
    chorme_options.add_argument("--disable-gpu")
    driver=webdriver.Chrome(chrome_options=chorme_options)
    driver.get("https://www.jd.com/")
    keyInput=driver.find_element_by_id("key")
    keyInput.send_keys("手机")
    keyInput.send_keys(Keys.ENTER)
    time.sleep(1)
    lt=driver.find_elements_by_xpath("//div[@id='J_goodsList']//li[@class='gl-item']")
    for i in lt:
        try:
            note=i.find_element_by_xpath(".//div[@class='p-name p-name-type-2']//em").text
            cur.execute("insert into testmodel_test2 (name) values ('%s')"%note)
        except:
            note=""
    cur.close()
    conn.commit()
    conn.close()
    
getPhone()
