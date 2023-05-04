from django.contrib import admin
from .models import Product, Shop, Stock

# Register your models here.
admin.site.register(Product)
# class RequestDemoAdmin(admin.ModelAdmin):
#   list_display = [field.name for field in
# Product._meta.get_fields()]

admin.site.register(Shop)

admin.site.register(Stock)