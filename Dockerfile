FROM python:3.8-alpine
COPY ./requirements.txt /app/requirements.txt

#ENV FLASK_ENV=development
ENV FLASK_APP=main.py
ENV FLASK_DEBUG=1

WORKDIR /app
RUN pip3 install -r requirements.txt
COPY . /app
EXPOSE  5000
ENTRYPOINT ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
#CMD ['sleep 5000']
