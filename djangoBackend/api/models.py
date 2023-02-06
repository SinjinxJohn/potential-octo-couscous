from django.db import models

# Create your models here.
class Categories(models.Model):
    name=models.CharField(max_length=100)
    image=models.URLField()

class Products(models.Model):
    name=models.CharField('Product Name',max_length=100)
    image=models.URLField()
    desc=models.CharField(max_length=400)
    price=models.IntegerField()
    category = models.ForeignKey(Categories,blank=True,null=True,on_delete=models.CASCADE)





