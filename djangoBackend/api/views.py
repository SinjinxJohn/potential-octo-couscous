from .models import Categories,Products
from .serializers import CategoriesSerializer,ProductsSerializer
from rest_framework.generics import ListAPIView
# Create your views here.
class CategoriesList(ListAPIView):
    queryset=Categories.objects.all()
    serializer_class=CategoriesSerializer

class ProductsList(ListAPIView):
    queryset=Products.objects.all()
    serializer_class=ProductsSerializer
