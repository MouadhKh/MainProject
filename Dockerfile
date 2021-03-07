FROM <DOCKER_USER>/<MAIN_PROJECT_BASE>

#ARG branch
#ENV PYTHONPATH=/opt/booksapi/app
RUN mkdir /opt/<PROJECT_NAME> &&\
          cd /opt/<PROJECT_NAME>

# giving a secret is VERY DANGEROUS, just a work around for OAuth Problem, will change later
# Investigate methods to protect secrets
RUN git clone https://github.com/MouadhKh/MainProject.git && cd <PROJECT_NAME> && git checkout dev
#RUN git clone https://sswbkr6yddyyyd75cozwco6u7gixwzruism5juheq43xtdepbcba@dev.azure.com/mouadh-kh/BooksAPI/_git/BooksAPI && cd BooksAPI && git checkout ${branch}
WORKDIR /opt/<PROJECT_NAME>

CMD [ "opt/<PROJECT_NAME>/app/app.py" ]
