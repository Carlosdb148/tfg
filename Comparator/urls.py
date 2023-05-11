from django.urls import path

from . import views


urlpatterns = [
    path(r'create', views.add_product, name='add-product'),
]