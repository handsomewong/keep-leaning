from selenium.webdriver.chrome.options import Options
import MySQLdb
import requests
from lxml import etree
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver import ActionChains
import time

def getPhone():
    chorme_options=Options()
    chorme_options.add_argument("--headless")
    chorme_options.add_argument("--disable-gpu")
    driver=webdriver.Chrome(chrome_options=chorme_options)
    #driver=webdriver.Chrome()
    #driver.maximize_window()
    #driver.get("https://www.sina.com.cn")
    driver.get("https://colourpop.com/collections/eye-palettes")
    
    time.sleep(3)
    js="window.scrollTo(0,document.body.scrollHeight)"
    driver.execute_script(js)

    conn=MySQLdb.connect(host='localhost',user='root',passwd='123456',db='wyjqz',charset='utf8')
    cur=conn.cursor()
    time.sleep(1)
    lt=driver.find_elements_by_xpath("//div[@class='collectioncontainer']//div[@class='product-info-inner']")

    for i in lt:
        try:
            name=i.find_element_by_xpath('.//div[@id="prod-title-price"]').text
            price=i.find_element_by_xpath('.//div[@id="price-html"]').text
            sql="insert into testmodel_test2 (name,price) values ('%s','%s')"%(name,price)
            cur.execute(sql)
        except:
            price=""
            name=""
            
    cur.close()
    conn.commit()
    conn.close()
    
getPhone()

        

