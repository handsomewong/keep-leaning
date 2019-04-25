import MySQLdb
import requests
from lxml import etree

def get_page(num):
    conn=MySQLdb.connect(host='localhost',user='root',passwd='123456',db='wyjqz',charset='utf8')
    cur=conn.cursor()
    
    url='https://movie.douban.com/top250?start=%s&filter=' % num
    headers={'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36'}
    response=requests.get(url,headers=headers)
    tree=etree.HTML(response.text)
    name=tree.xpath('//span[@class="title"][1]/text()')
    detail1=tree.xpath('//div[@class="bd"]//p[@class=""]/text()[1]')
    detail2=tree.xpath('//div[@class="bd"]//p[@class=""]/text()[2]')
    for i in range(len(name)):
        sql='insert into testmodel_test (name,detail1,detail2) values ("%s","%s","%s") '% (name[i],detail1[i],detail2[i])
        cur.execute(sql)
    cur.close()
    conn.commit()
    conn.close()

def get_all():
    for i in range(0,250,25):
        get_page(i)
        
get_all()
