from django.conf.urls import *
from TestModel import views

app_name='[myapp]'
urlpatterns = [
    url(r'^qizhong/(\d*)$', views.qizhong,name='first'),
    url(r'^qizhong2/(\d*)$', views.qizhong2,name='second'),
]