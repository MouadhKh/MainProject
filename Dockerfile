FROM ubuntu:focal

ENV PYTHONPATH=$PYTHONPATH:/opt
RUN mkdir dependencies
ADD requirements.txt /dependencies
RUN mkdir wheels
ADD pip-20.2.2-py2.py3-none-any.whl /wheels

RUN apt-get update && apt-get -yq install --no-install-recommends \
    wget python3 python3-setuptools

#install git
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

# install python dependencies
RUN	cd /wheels && /bin/sh -c "python3 pip-20.2.2-py2.py3-none-any.whl/pip install -r /dependencies/requirements.txt" \
    && rm -rf opt/wheels/pip-20.2.2-py2.py3-none-any.whl /requirements.txt

RUN git clone https://github.com/MouadhKh/MainProject.git && cd <PROJECT_NAME> && git checkout ${branch}
#RUN git clone https://sswbkr6yddyyyd75cozwco6u7gixwzruism5juheq43xtdepbcba@dev.azure.com/mouadh-kh/BooksAPI/_git/BooksAPI && cd BooksAPI && git checkout ${branch}
WORKDIR /opt/<PROJECT_NAME>

CMD [ "opt/<PROJECT_NAME>/app/app.py" ]
