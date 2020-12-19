FROM kaiiz3n/books-api-base

ARG branch
ENV PYTHONPATH=/opt/booksapi/app

RUN     git clone -b ${branch} https://sswbkr6yddyyyd75cozwco6u7gixwzruism5juheq43xtdepbcba@dev.azure.com/mouadh-kh/BooksAPI/_git/BooksAPI /opt/booksapi

ENTRYPOINT ["opt/booksapi/app/app.py"]