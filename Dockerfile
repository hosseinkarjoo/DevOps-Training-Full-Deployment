FROM ubuntu as BASE
RUN apt-get update -y && apt-get install -y python3-pip python3-dev python3
COPY ./requierments.txt /app/requierments.txt

ENV FLASK_ENV=development
FROM BASE
WORKDIR /app
RUN pip install -r requierments.txt
COPY . /app
ENTRYPOINT ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
