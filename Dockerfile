FROM kaiiz3n/books-api-base

ARG branch
ENV PYTHONPATH=/opt/booksapi/app

RUN     git clone -b ${branch} https://mouadh-kh@dev.azure.com/mouadh-kh/BooksAPI/_git/BooksAPI /opt/booksapi \
		&& if [ ${branch} = release ]; then rm -rf /data ; fi

ENTRYPOINT ["opt/booksapi/app/app.py"]