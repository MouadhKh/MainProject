FROM kaiiz3n/books-api-base

ARG branch
#ENV PYTHONPATH=/opt/booksapi/app
RUN mkdir /opt/booksapi &&\
          cd opt/booksapi

# giving a secret is VERY DANGEROUS, just a work around for OAuth Problem, will change later
# Investigate methods to protect secrets
RUN git clone https://sswbkr6yddyyyd75cozwco6u7gixwzruism5juheq43xtdepbcba@dev.azure.com/mouadh-kh/BooksAPI/_git/BooksAPI && cd BooksAPI && git checkout ${branch}
WORKDIR /opt/booksapi

ENTRYPOINT [ "python" ]

CMD [ "opt/booksapi/app/app.py" ]
