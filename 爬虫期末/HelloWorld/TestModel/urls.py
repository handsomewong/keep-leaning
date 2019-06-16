from django.conf.urls import *
from TestModel import views

app_name='[myapp]'
urlpatterns = [
    url(r'^index/', views.index,name='index'),
    url(r'^qimo/(\d*)$', views.qimo,name='first'),
    url(r'^qimo2/(\d*)$', views.qimo2,name='second'),
]