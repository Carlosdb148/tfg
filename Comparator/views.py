from rest_framework import serializers
from rest_framework import status
from .serializers import RegisterSerializer, UserSerializer, ProductSerializer, ShopSerializer, StockSerializer
from rest_framework.decorators import api_view
from .models import Product, Shop, Stock
from rest_framework.response import Response
from rest_framework import generics, permissions, mixins
from django.contrib.auth.models import User
from rest_framework.permissions import  IsAdminUser, IsAuthenticated
from rest_framework.views import APIView


from bs4 import BeautifulSoup
from urllib.request import Request, urlopen
import json

 
class AddProduct(generics.GenericAPIView):
    permission_classes = [IsAuthenticated, IsAdminUser]
    def post(self, request):
        item = ProductSerializer(data=request.data)
        
        # validating for already existing data
        if Product.objects.filter(**request.data).exists():
            raise serializers.ValidationError('This data already exists')
    
        if item.is_valid():
            item.save()
            return Response('Product saved correctly')
        else:
            return Response('An error ocurred while saving the product', status=status.HTTP_404_NOT_FOUND)
    
class GetProducts(generics.GenericAPIView):
    def get(self, request):
        # checking for the parameters from the URL
        q = request.GET.get('q')
        if(q):
            items = Product.objects.filter(name__contains=q)
            serializer = ProductSerializer(items, many=True)
            # if there is something in items else raise error
            if items:
                return Response(serializer.data)
            else:
                return Response(status=status.HTTP_404_NOT_FOUND)
        else:
            items = Product.objects.all()
            serializer = ProductSerializer(items, many=True)

            # if there is something in items else raise error
            if items:
                return Response(serializer.data)
            else:
                return Response(status=status.HTTP_404_NOT_FOUND)
    

#Register API
class RegisterApi(APIView):
    def post(self, request, *args,  **kwargs):
        serializer = RegisterSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.is_active = True
        user = serializer.save()
        return Response({
            "message": "User Created Successfully.  Now perform Login to get your token",
        })
    


#Return prices
class GetPrice(generics.GenericAPIView):
    def get(self, request, id):
        def price(id):
            try:
                numShops = Stock.objects.filter(product_id = id).distinct("shop_id").order_by("shop_id", "-date")
                num = len(numShops)
                query = '{}'
                for x in range(num):
                    shop = Shop.objects.get(id = numShops[x].shop_id)
                    product = Stock.objects.filter(product_id = id, shop_id = shop.id).order_by("date", )
                    data = {shop.name:str(product[0].price)}
                    result = json.loads(query)
                    result.update(data)
                    query = json.dumps(result)
                    print(product[0].date)

                return json.loads(query)
            except Exception as e:
                print(e)
                return "Error"
        def shopURL(id):
            try:
                numShops = Stock.objects.filter(product_id = id).distinct("shop_id").order_by("shop_id", "-date")
                num = len(numShops)
                query = '{}'
                for x in range(num):
                    shop = Shop.objects.get(id = numShops[x].shop_id)
                    product = Stock.objects.filter(product_id = id, shop_id = shop.id).order_by("date")
                    data = {shop.name:str(product[0].url)}
                    result = json.loads(query)
                    result.update(data)
                    query = json.dumps(result)

                return json.loads(query)
            except Exception as e:
                print(e)
                return "Error"
        def getData(id):
            try:
                productData = Product.objects.get(id = id)
                productId = productData.id
                productName = productData.name
                productImg = "img"
                productDesc = productData.description
                data = { "id":productId,
                         "nombre":productName,
                         "foto":productImg,
                         "precio":price(id),
                         "descripcion":productDesc,
                          "urls":shopURL(id) }
                data = json.dumps(data)
                return json.loads(data)

            except Exception as e:
                print(e)
                return "Error"

        return Response({
            "data" : getData(id)

        })
