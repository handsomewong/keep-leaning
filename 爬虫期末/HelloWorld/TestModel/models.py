from django.db import models

# Create your models here.
class Test(models.Model):
    name = models.CharField(max_length=100)
    detail1=models.CharField(max_length=1000,default="")
    detail2=models.CharField(max_length=1000,default="")

class Test2(models.Model):
    name = models.CharField(max_length=1000)
    price = models.CharField(max_length=50,default="")
    