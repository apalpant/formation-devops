FROM python:3.7-alpine

WORKDIR /app

ENV FLASK_RUN_HOST=0.0.0.0

# Update aptitude with new repo
RUN apk update \
 && apk add git

RUN git clone https://github.com/vanessakovalsky/example-python.git

RUN cp example-python/vagrant/src/main.py .

RUN rm -r example-python/

COPY requirements.txt .

RUN pip install -r requirements.txt

# Copie du docker intermediaire vers le courant
COPY . .

RUN rm requirements.txt Dockerfile

CMD ["python3", "main.py"]
