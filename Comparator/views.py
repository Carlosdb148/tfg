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
from ip2geotools.databases.noncommercial import DbIpCity
from serpapi import GoogleSearch


from bs4 import BeautifulSoup
from urllib.request import Request, urlopen
import json

 
class AddProduct(generics.GenericAPIView):
    permission_classes = [IsAuthenticated]
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
        filter = request.GET.get('type')

        items = Product.objects.all()

        if(q):
            items = items.filter(name__contains=q)
        if(filter):
            if filter == 'mobile':
                items = items.filter(type=1)
            elif filter == 'computer':
                items = items.filter(type=2)
            elif filter == 'tablet':
                items = items.filter(type=3)

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
        serializer.save()
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
                productImg = productData.image
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
    
class GetLocation(generics.GenericAPIView):
    def get_client_ip(self, request):
        x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
        if x_forwarded_for:
            ip = x_forwarded_for.split(',')[0]
        else:
            ip = request.META.get('REMOTE_ADDR')
        return ip
    def printDetails(self, ip):
        res = DbIpCity.get(ip, api_key="free")
        latitude = '%.7f'%(res.latitude)
        longitude = '%.7f'%(res.longitude) 
        return({'latitude' : latitude, 'longitude': longitude, 'city' : res.city, 'region' : res.region, 'country' : res.country})
    def post(self, request):
        ip = self.get_client_ip(request)
        coords = self.printDetails(ip)
        ll = f"@{coords['latitude']},{coords['longitude']},15.1z"
        params = {
            "engine": "google_maps",
            "q": "MediaMarkt",
            "ll": ll,
            "type": "search",
            "api_key": "fc60637faa050e2a6af4225a787b5fe789c962cd82e95c3c24406e8ffcabf4be"
        }

        search = GoogleSearch(params)
        results = search.get_dict()

        data_id = results['local_results'][0]['data_id']
        place_id = results['local_results'][0]['place_id']
        latitude = results['local_results'][0]['gps_coordinates']['latitude']
        longitude = results['local_results'][0]['gps_coordinates']['longitude']

        data = f'!4m5!3m4!1s{data_id}!8m2!3d{latitude}!4d{longitude}'

        params = {
            "engine": "google_maps",
            "type": "place",
            "data": data,
            "place_id" : place_id,
            "api_key": "fc60637faa050e2a6af4225a787b5fe789c962cd82e95c3c24406e8ffcabf4be"
        }

        search = GoogleSearch(params)
        results = search.get_dict()
        return Response(results)
