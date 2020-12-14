from flask import Flask
from flask import jsonify


def create_app():
    return Flask(__name__)


app = create_app()


@app.route('/')
def index():
    return 'Books API built with Flask(v1.0.0)'


@app.route('/books')
def resources():
    return jsonify(title='Factfullness',
                   description='Factfulness:The stress-reducing habit of only carrying opinions for which you have strong supporting facts',
                   goodreads_rating='4.35')


if __name__ == '__main__':
    app.run(host='0.0.0.0')
