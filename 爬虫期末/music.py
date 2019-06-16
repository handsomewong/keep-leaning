import MySQLdb
import requests
from lxml import etree
import re

def get_page(num):
    conn=MySQLdb.connect(host='localhost',user='root',passwd='123456',db='wyjqz',charset='utf8')
    cur=conn.cursor()
    
    url='https://music.douban.com/top250?start=%s' % num
    headers={'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36'}
    response=requests.get(url,headers=headers)
    tree=etree.HTML(response.text)
    name=tree.xpath('//tr[@class="item"]//div[@class="pl2"]//a[1]/text()')
    detail=tree.xpath('//div[@class="pl2"]//p/text()')
    stars=tree.xpath('//div[@class="star clearfix"]//span[2]/text()')

    for i in name:
        if(i.strip()==''):
            name.remove(i)

    for i in range(len(name)):
        sql='insert into testmodel_test (name,detail1,detail2) values ("%s","%s","%s")' % (name[i],detail[i],stars[i])
        cur.execute(sql)
    cur.close()
    conn.commit()
    conn.close()

def get_all():
    for i in range(0,250,25):
        get_page(i)
        
get_all()
