import random

import requests
import yaml
from flask import Flask, request, redirect
import time

loadbalancer = Flask(__name__)

def load_configuration(path):
    with open(path) as config_file:
        config = yaml.load(config_file, Loader=yaml.FullLoader)
    return config


config = load_configuration('/app/loadbalancer.yaml')


@loadbalancer.route('/')
def router():
    for entry in config['paths']:
        print(random.choice(entry["servers"]))
        return redirect(f'http://{random.choice(entry["servers"])}')


loadbalancer.run(debug=False, host='0.0.0.0', port=5000)