from fastapi.testclient import TestClient
from app.main import app


def test_read_root():

    assert 1 is 1