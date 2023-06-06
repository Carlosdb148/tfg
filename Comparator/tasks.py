from __future__ import absolute_import, unicode_literals
from celery import shared_task
from .models import Product, Shop, Stock

from bs4 import BeautifulSoup
from urllib.request import Request, urlopen
import nums_from_string

from datetime import datetime

@shared_task()
def task_number_one():
    print("hola")
    def scrap(product, name):
        url = str(product.url)
        def amazon(soup):
            try:
                results = soup.find(id="twister-plus-price-data-price")
                price = results.get('value')
                saveProdcut = Stock(product=product.product,shop=product.shop,price=price[:-2], date=datetime.now(), url=url)
                saveProdcut.save()
            except Exception as e:
                print(e)
                return "Error"
        def mediaM(soup):
            try:
                results = soup.find(id="StyledPdpWrapper")
                job_elements = results.find_all("span", class_="sc-hLBbgP casGRl")
                if len(job_elements) != 0:
                    for job_element in job_elements:
                        prices = nums_from_string.get_nums(job_element.text.strip())
                else:
                    job_elements = results.find_all("span", class_="sc-hLBbgP qDhCX")
                    for job_element in job_elements:
                        prices = nums_from_string.get_nums(job_element.text.strip())
                    
                saveProdcut = Stock(product=product.product,shop=product.shop,price=prices[0], date=datetime.now(), url=url)
                saveProdcut.save()
            except Exception as e:
                print(e)
                return "Error"
        def worten(soup):
            try:
                results = soup.find(class_="price__numbers raised-decimal price__numbers--bold")
                price = results.get('value')
                saveProdcut = Stock(product=product.product,shop=product.shop,price=price[:-2], date=datetime.now(), url=url)
                saveProdcut.save()
            except Exception as e:
                print(e)
                return "Error"
        def pHouse(soup):
            try:
                results = soup.find(class_="precio mb-10")
                prices = nums_from_string.get_nums(results.text.strip())
                saveProdcut = Stock(product=product.product,shop=product.shop,price=prices[0], date=datetime.now(), url=url)
                saveProdcut.save()
            except Exception as e:
                print(e)
                return "Error"
            
        req = Request(
            url=url, 
            headers={'User-Agent': 'Mozilla/5.0 (iPad; CPU OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148',
                    'Accept-Language': 'en-US,en;q=0.9,es;q=0.8',
                    'Upgrade-Insecure-Requests': '1',
                    'referer' : 'https://www.google.com/',
                    'Accept': 'text/html'}
            )
        html = urlopen(req).read().decode("utf-8")
        soup = BeautifulSoup(html, "html.parser")
        if (name == "Amazon"):
            amazon(soup)
        elif(name == "MediaMarkt"):
            mediaM(soup)
        elif(name == "Worten"):
            worten(soup)
        elif(name == "PhoneHouse"):
            pHouse(soup)
        else:
            print("error")

    try:
        products = Product.objects.all().order_by("id")
        for x in products:
            numShops = Stock.objects.filter(product_id = x.id).distinct("shop_id").order_by("shop_id", "-date")
            num = len(numShops)
            for y in range(num):
                shop = Shop.objects.get(id = numShops[y].shop_id)
                product = Stock.objects.filter(product_id = x.id, shop_id = shop.id).order_by("date")
                # scrap(str(product[0].url), shop.name)
                scrap(product[0], shop.name)

    except Exception as e:
        print(e)
        return "Error"