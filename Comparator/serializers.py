from django.db.models import fields
from rest_framework import serializers
from .models import Product
from .models import Shop
from .models import Stock
 
class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ('name', 'description', 'image')


class ShopSerializer(serializers.ModelSerializer):
    class Meta:
        model = Shop
        fields = ('name', 'logo', 'products')


class StockSerializer(serializers.ModelSerializer):
    class Meta:
        model = Stock
        fields = ('product', 'shop', 'price', 'date', 'url')