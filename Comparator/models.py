from django.db import models

class Product(models.Model):
    name = models.CharField(max_length=128,  blank=False)
    description = models.TextField( blank=False)
    image = models.ImageField(upload_to='images/', default=None)

class Shop(models.Model):
    name = models.CharField(max_length=128, blank=False)
    logo = models.ImageField(upload_to='images/', default=None, blank=False)
    products = models.ManyToManyField(Product, through='Stock')


class Stock(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE,)
    shop = models.ForeignKey(Shop, on_delete=models.CASCADE,)
    price= models.DecimalField(max_digits=10, decimal_places=2, blank=False)
    date = models.DateField()
    url = models.TextField(blank=False)
