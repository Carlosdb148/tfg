from rest_framework import serializers
from rest_framework import status
from .serializers import ProductSerializer
from rest_framework.decorators import api_view
from .models import Product
from rest_framework.response import Response
 
@api_view(['POST'])
def add_product(request):
    item = ProductSerializer(data=request.data)
    
    # validating for already existing data
    if Product.objects.filter(**request.data).exists():
        raise serializers.ValidationError('This data already exists')
 
    if item.is_valid():
        item.save()
        return Response('Product saved correctly')
    else:
        return Response('An error ocurred while saving the product', status=status.HTTP_400_NOT_FOUND)
    
@api_view(['GET'])
def get_products(self):
    # checking for the parameters from the URL
    items = Product.objects.all()
    serializer = ProductSerializer(items, many=True)

    # if there is something in items else raise error
    if items:
        return Response(serializer.data)
    else:
        return Response(status=status.HTTP_404_NOT_FOUND)
