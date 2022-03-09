FROM ubuntu as BASE
RUN apt-get update -y && apt-get install -y python3-pip python3-dev python3
COPY ./requierments.txt /app/requierments.txt

#ENV FLASK_ENV=development
ENV FLASK_APP=main.py
ENV FLASK_DEBUG=1
FROM BASE
WORKDIR /app
RUN pip3 install -r requierments.txt
COPY . /app
EXPOSE  5000
ENTRYPOINT ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
#CMD ['sleep 5000']
