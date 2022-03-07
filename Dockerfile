FROM ubuntu as BASE
RUN apt-get update -y && apt-get install -y python-pip python-dev
COPY ./requierments.txt /app/requierments.txt


FROM BASE
WORKDIR /app
RUN pip install -r requierments.txt
COPY . /app
ENTRYPOINT ['python']
CMD ['main.py']
