FROM <DOCKER_USER>/<MAIN_PROJECT_BASE>

ARG branch
#ENV PYTHONPATH=/opt/booksapi/app
RUN mkdir /opt/<PROJECT_NAME> &&\
          cd /opt/<PROJECT_NAME>


RUN git clone <MAIN_REPO_LINK> && cd <PROJECT_NAME> && git checkout ${branch}

WORKDIR /opt/<PROJECT_NAME>

CMD [ "opt/<PROJECT_NAME>/app/app.py" ]
