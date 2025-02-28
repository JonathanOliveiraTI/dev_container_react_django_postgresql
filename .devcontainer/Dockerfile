FROM python:3.10.2-slim

RUN useradd -ms /bin/bash python

RUN pip install pipenv

RUN apt-get update && apt-get install -y postgresql-client     

WORKDIR /rotarh

COPY . /rotarh/

USER python

ENV PIPENV_VENV_IN_PROJECT=True 