from django.urls import path

from . import views


urlpatterns = [
    path(r'createProduct', views.add_product, name='add-product'),
    path(r'getProducts', views.get_products, name='get_products'),
]