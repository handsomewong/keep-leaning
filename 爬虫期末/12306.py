import requests
from selenium.webdriver import Chrome
from selenium import webdriver
from selenium.webdriver import ChromeOptions
import time
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains
from PIL import Image
import win32api
import win32con
import os
import re

def main():
    username='18767305246'
    userpassword='www980124'
    start_station='温州南'
    end_station='嘉兴南'
    date='2019-06-15'
    loginandget(username,userpassword,start_station,end_station,date)

def loginandget(username,userpassword,start_station,end_station,date):
    pic_name=None
    options = webdriver.ChromeOptions()
    options.add_argument('user-agent="Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36"')
    driver = webdriver.Chrome(chrome_options=options)
    driver.maximize_window()
    driver.get('https://kyfw.12306.cn/otn/login/init')

    time.sleep(2)

    driver.find_element_by_xpath('//*[@id="username"]').send_keys(username) #发送帐号名
    driver.find_element_by_xpath('//*[@id="password"]').send_keys(userpassword) #发送帐号名
    time.sleep(2)
    pic_name=get_a_verify_pic(driver)           #截取12306验证码图片
    time.sleep(5)
    body_list=ana_pic(pic_name)  #破解12306验证码
    
    click_pic(driver,body_list)
    time.sleep(2)

    driver.find_element_by_xpath('//*[@class="btn200s"]').click()
    
    time.sleep(10) # 等待cookie加载完成
    cookies = driver.get_cookies()
    print(cookies)

    
    url = 'https://kyfw.12306.cn/otn/resources/js/framework/station_name.js?station_version=1.8971'
    response = requests.get(url, verify=False)
    stations = re.findall(r'([\u4e00-\u9fa5]+)\|([A-Z]+)', response.text)
    station_codes=dict(stations)

    driver.get('https://kyfw.12306.cn/otn/leftTicket/init?linktypeid=dc&fs='
               +start_station+','+station_codes[start_station]+'&ts='+end_station
               +','+station_codes[end_station]+'&date='+date+'&flag=N,N,Y')

    time.sleep(5)
    lt = driver.find_elements_by_xpath('//div[@id="t-list"]//tr[@class]')#.get_attribute("innerHTML")
    for i in lt:
        try:
            number=i.find_element_by_xpath('.//div[@class="train"]//a').text
            start=i.find_element_by_xpath('.//div[@class="cdz"]//strong[1]').text
            end=i.find_element_by_xpath('.//div[@class="cdz"]//strong[2]').text
            starttime=i.find_element_by_xpath('.//div[@class="cds"]//strong[1]').text
            endtime=i.find_element_by_xpath('.//div[@class="cds"]//strong[2]').text
            times=i.find_element_by_xpath('.//div[@class="ls"]//strong[1]').text
            print("number:"+number+",start:"+start+",end:"+end+",starttime:"+
                  starttime+",endtime:"+endtime+",time:"+times)
        except:
            None

VK_CODE ={'enter':0x0D, 'down_arrow':0x28}
#键盘键按下
def keyDown(keyName):
    win32api.keybd_event(VK_CODE[keyName], 0, 0, 0)
#键盘键抬起
def keyUp(keyName):
    win32api.keybd_event(VK_CODE[keyName], 0, win32con.KEYEVENTF_KEYUP, 0)
#截取一张验证码图片，保存
def get_a_verify_pic(b):
    if(os.path.exists("C:/Users/44876/Downloads/captcha-image.jpeg")):
        os.remove("C:/Users/44876/Downloads/captcha-image.jpeg")
        
    element=b.find_element_by_xpath("//*[@class='touclick-image']")
    action = ActionChains(b).move_to_element(element)#移动到该元素
    action.context_click(element).perform()#右键点击该元素
    time.sleep(1)
    #按v
    win32api.keybd_event(86, 0, 0, 0)
    win32api.keybd_event(86, 0, win32con.KEYEVENTF_KEYUP, 0)
    time.sleep(2)
    #按enter
    keyDown("enter")
    keyUp("enter")
    time.sleep(1)
    
    return "captcha-image.jpeg"

#破解图片验证码
def ana_pic(pic_name):
    body_list=[]
    url='http://littlebigluo.qicp.net:47720/'
    files={'pic_xxfile':(pic_name,open("C:/Users/44876/Downloads/"+pic_name,'rb'),'image/png')}
    res=requests.post(url,files=files)#post pic

    if res.status_code == 200:#return ok
        if u"图片貌似选" in res.text:#识别验证码成功                
            body_str_1=res.text.split(u'<B>')
            body_str=body_str_1[1].split(u'<')[0].split()
            for index in body_str:
                body_list.append(int(index))
            return body_list


#按输入的下标，点击一张验证码图片
def click_one_pic(b,i):
    try:
        imgelement=b.find_element_by_xpath("//*[@class='touclick-image']")
        if i<=4:
            ActionChains(b).move_to_element_with_offset(imgelement,40+72*(i-1),73).click().perform()
        else:
            i -= 4
            ActionChains(b).move_to_element_with_offset(imgelement,40+72*(i-1),145).click().perform()
    except:
        print("Wa -- click one pic except!!!")
        
#按bodylist 指示，点击指定验证图片
def click_pic(b,body_list):
    for i in range(len(body_list)):
        click_one_pic(b,body_list[i])
        time.sleep(1)

if __name__ == "__main__":
    main()

