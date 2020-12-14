FROM ubuntu:latest

MAINTAINER Mouadh Khlifi "Mouadh.Khlifi@Student.HTW-Berlin.de"
RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev

COPY ./requirements.txt /requirements.txt

WORKDIR /

RUN pip3 install -r requirements.txt

 #The commands before will be cached as long as dependencies in requirements.txt haven't changed

COPY . /

ENTRYPOINT [ "python3" ]

CMD [ "app/app.py" ]