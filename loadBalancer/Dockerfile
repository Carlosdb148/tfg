FROM python:3.9-alpine
RUN pip install flask pyyaml requests
COPY ./app.py /app/app.py
COPY ./loadbalancer.yaml /app/loadbalancer.yaml
CMD ["python", "/app/app.py"]