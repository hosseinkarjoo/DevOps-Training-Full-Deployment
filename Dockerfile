FROM ubuntu as BASE
RUN apt-get update -y && apt-get install -y python3-pip python3-dev
COPY ./requierments.txt /app/requierments.txt


FROM BASE
WORKDIR /app
RUN pip install -r requierments.txt
COPY . /app
ENTRYPOINT ['python']
CMD ['main.py']
