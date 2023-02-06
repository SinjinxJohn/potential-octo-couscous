from rest_framework import serializers
from .models import Categories,Products

class CategoriesSerializer(serializers.ModelSerializer):
    class Meta:
        model=Categories
        fields=['id','name','image']

class ProductsSerializer(serializers.ModelSerializer):
    class Meta:
        model=Products
        fields=['id','name','image','price','desc','category']