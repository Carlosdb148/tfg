from rest_framework import serializers
from rest_framework import status
from .serializers import ProductSerializer
from rest_framework.decorators import api_view
from .models import Product
from rest_framework.response import Response
from rest_framework import generics, permissions, mixins
from .serializers import RegisterSerializer, UserSerializer
from django.contrib.auth.models import User
from rest_framework.permissions import  IsAdminUser, IsAuthenticated

 
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
    

#Register API
class RegisterApi(generics.GenericAPIView):
    serializer_class = RegisterSerializer
    def post(self, request, *args,  **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.is_active = True
        user = serializer.save()
        return Response({
            "user": UserSerializer(user,    context=self.get_serializer_context()).data,
            "message": "User Created Successfully.  Now perform Login to get your token",
        })