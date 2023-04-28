from django.db import models

class Product(models.Model):
    name = models.CharField(max_length=128)
    description = models.TextField()
    image = models.ImageField(upload_to='images/', default=None)

class Shop(models.Model):
    name = models.CharField(max_length=128)
    logo = models.ImageField(upload_to='images/', default=None)
    products = models.ManyToManyField(Product, through='Stock')


class Stock(models.Model):
    person = models.ForeignKey(Product, on_delete=models.CASCADE,)
    group = models.ForeignKey(Shop, on_delete=models.CASCADE,)
    price= models.DecimalField(max_digits=10, decimal_places=2)
    date = models.DateField() 
