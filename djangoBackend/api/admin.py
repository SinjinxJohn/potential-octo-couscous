from django.contrib import admin
from .models import Categories,Products
# Register your models here.
@admin.register(Categories)
class CategoriesAdmin(admin.ModelAdmin):
    list_display=['id','name','image']

@admin.register(Products)
class ProductsAdmin(admin.ModelAdmin):
    list_display2=['id','name','desc','image','price','category']