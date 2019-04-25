from django.conf.urls import *
from TestModel import views
 
urlpatterns = [
    url(r'^wyj/', include(('TestModel.urls'),namespace='myapp')),
]