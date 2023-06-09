from __future__ import absolute_import, unicode_literals
from celery import shared_task
from .models import Product, Shop, Stock
from bs4 import BeautifulSoup
from urllib.request import Request, urlopen
import nums_from_string
from django.utils import timezone
from django.core.mail import send_mail, send_mass_mail


@shared_task()
def task_number_one():
    def scrap(product, name):
        url = str(product.url)
        # def sendMail(price):
        #     # usersID = XXX.objects.filter(product_id = product.id).distinct("product_id")
        #     datatuple = []
        #     # for userID in usersID:
        #     #     user = XXXUserXXX.objects.filter(id = userID.id)
        #     #     datatuple.append(("Traziem ha detectado un descuento", "El producto " + product.name + " ha sufrido una baja de precio en la tienda " + product.shop + ", costaba " + product.price + " y ahora su precio es " + price, "carmelonixac@gmail.com", [user.correo]))
        #     datatuple.append(("Traziem ha detectado un descuento", "El producto " + "product.name" + " ha sufrido una baja de precio en la tienda " + "product.shop" + ", costaba " + "product.price" + " y ahora su precio es " + "price", "carmelonixac@gmail.com", ["izamm1610@gmail.com"]))
        #     datatuple.append(("Traziem ha detectado un descuento", "El producto " + "product.name" + " ha sufrido una baja de precio en la tienda " + "product.shop" + ", costaba " + "product.price" + " y ahora su precio es " + "price", "carmelonixac@gmail.com", ["imorales1610@ieszaidinvergeles.org"]))

        #     send_mass_mail(tuple(datatuple))
        def amazon(soup):
            try:
                results = soup.find(id="twister-plus-price-data-price")
                price = results.get('value')
                saveProdcut = Stock(product=product.product,shop=product.shop,price=price[:-2], date=timezone.now(), url=url)
                saveProdcut.save()
            except Exception as e:
                print(e)
                return "Error"
            # if price < product.price:
            #     sendMail(price)
        def mediaM(soup):
            try:
                results = soup.find(id="StyledPdpWrapper")
                job_elements = results.find_all("span", class_="sc-hLBbgP casGRl")
                if len(job_elements) != 0:
                    for job_element in job_elements:
                        price = nums_from_string.get_nums(job_element.text.strip())
                else:
                    job_elements = results.find_all("span", class_="sc-hLBbgP qDhCX")
                    for job_element in job_elements:
                        price = nums_from_string.get_nums(job_element.text.strip())
                    
                saveProdcut = Stock(product=product.product,shop=product.shop,price=price[0], date=timezone.now(), url=url)
                saveProdcut.save()
            except Exception as e:
                print(e)
                return "Error"
            # if price < product.price:
            #     sendMail(price)
        def worten(soup):
            try:
                results = soup.find(class_="price__numbers raised-decimal price__numbers--bold")
                price = results.get('value')
                saveProdcut = Stock(product=product.product,shop=product.shop,price=price[:-2], date=timezone.now(), url=url)
                saveProdcut.save()
            except Exception as e:
                print(e)
                return "Error"
            # if price < product.price:
            #     sendMail(price)
        def pHouse(soup):
            try:
                results = soup.find(class_="precio mb-10")
                price = nums_from_string.get_nums(results.text.strip())
                saveProdcut = Stock(product=product.product,shop=product.shop,price=price[0], date=timezone.now(), url=url)
                saveProdcut.save()
            except Exception as e:
                print(e)
                return "Error"
            # if price < product.price:
            #     sendMail(price)

            
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
        sendMail(1)
    
    try:
        products = Product.objects.all().order_by("id")
        for x in products:
            numShops = Stock.objects.filter(product_id = x.id).distinct("shop_id").order_by("shop_id", "-date")
            num = len(numShops)
            for y in range(num):
                shop = Shop.objects.get(id = numShops[y].shop_id)
                product = Stock.objects.filter(product_id = x.id, shop_id = shop.id).order_by("date")
                scrap(product[0], shop.name)
    except Exception as e:
        print(e)
        return "Error"