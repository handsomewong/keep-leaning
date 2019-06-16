from django.http import HttpResponse
import requests
from lxml import etree
from django.shortcuts import render
from TestModel.models import Test
from TestModel.models import Test2
from django.core.paginator import Paginator
from django.core.paginator import EmptyPage
from django.core.paginator import PageNotAnInteger

# Create your views here.
def index(request):
    return render(request,'Index.html')

def qimo(request,current_page):
    if not current_page:
        current_page = 1
    first_list = Test.objects.all().order_by("id")    # 一定要排序
    paginator = Paginator(first_list, 15) # 每页15条记录
    page = paginator.page(int(current_page)) # 获取第一页数据，从1开始
    context = {'page': page}
    return render(request, 'first.html', context)   
    
def qimo2(request,current_page):
    if not current_page:
        current_page = 1
    second_list = Test2.objects.all().order_by("id")    # 一定要排序
    paginator = Paginator(second_list, 10) # 每页10条记录
    page = paginator.page(int(current_page)) # 获取第一页数据，从1开始
    context = {'page': page}
    return render(request, 'second.html', context)