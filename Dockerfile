FROM python:3
RUN mkdir /app     
WORKDIR /app
COPY requirements.txt /app/   
RUN  pip install -r  requirements.txt
COPY . /app/
EXPOSE  5000
ENTRYPOINT ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
