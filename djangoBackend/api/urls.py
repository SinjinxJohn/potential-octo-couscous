from django.urls import path
from api import views

urlpatterns=[
    path('categories/',views.CategoriesList.as_view()),
    path('products/',views.ProductsList.as_view())
]

