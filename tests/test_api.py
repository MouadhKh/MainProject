import json

import pytest

from app import app as flask_app


@pytest.fixture
def app():
    flask_app.app.config['TESTING'] = True
    yield flask_app


@pytest.fixture
def client(app):
    return app.app.test_client()


def test_index(client):
    res = client.get('/')
    assert res.status_code == 200
    assert res.data == b'Books API built with Flask(v1.0.0)'


def test_booksEndpoint(client):
    res = client.get('/books')
    expected_obj = json.loads(res.get_data(as_text=True))
    assert res.status_code == 200
    assert expected_obj["title"] == 'Factfullness'
    assert expected_obj[
               "description"] == 'Factfulness:The stress-reducing habit of only carrying opinions for which you have strong supporting facts'
    assert expected_obj["goodreads_rating"] == '4.35'
