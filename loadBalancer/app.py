import yaml
from flask import Flask, request, redirect
from pythonping import ping


loadbalancer = Flask(__name__)

def load_configuration(path):
    with open(path) as config_file:
        config = yaml.load(config_file, Loader=yaml.FullLoader)
    return config


config = load_configuration('/app/loadbalancer.yaml')


@loadbalancer.route('/')
def router():
    for entry in config['paths']:
        minPing = 100
        index = 0
        for ip in entry["internalsIPs"]:
            response_list = ping(ip, size=40, count=10)
            if response_list.rtt_avg_ms <= minPing:
                minPing = response_list.rtt_avg_ms
                server = entry["servers"][index]
            index =+ index
            print(response_list.rtt_avg_ms)

    return redirect(f'http://{server}')

loadbalancer.run(debug=True, host='0.0.0.0', port=5000)