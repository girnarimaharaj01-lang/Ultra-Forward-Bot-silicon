FROM python:3.10.8-slim-buster

RUN apt update &&     apt install python3 python3-pip -y &&     apt install nginx supervisor -y
RUN apt installgit clone https://github.com/Silicon-Developer/Ultra-Forward-Bot.git
RUN apt update && apt upgrade -y
RUN apt install git -y
COPY requirements.txt /requirements.txt

RUN cd /
RUN pip3 install -U pip && pip3 install -U -r requirements.txt
RUN mkdir /nd-Forward-Bot
WORKDIR /nd-Forward-Bot
COPY . /nd-Forward-Bot
CMD gunicorn app:app & python3 main.py
