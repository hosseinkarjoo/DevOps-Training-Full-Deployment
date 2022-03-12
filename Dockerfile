FROM python:3

ENV FLASK_APP=app.py
ENV FLASK_DEBUG=1
ENV CACHE_TYPE = redis
ENV CACHE_REDIS_PORT = 6379
ENV CACHE_REDIS_DB=0
ENV CACHE_REDIS_URL = redis://devops-training-Redis:6379/0
ENV CACHE_DEFAULT_TIMEOUT = 500
ENV CACHE_HOST = devops-training-Redis

RUN mkdir /app     
WORKDIR /app
COPY requirements.txt /app/   
RUN  pip install -r  requirements.txt
RUN  pip3 install -r  requirements.txt
COPY . /app
EXPOSE  5001
ENTRYPOINT ["python3", "-m", "flask", "run", "--host=0.0.0.0", "--port=5001"]
