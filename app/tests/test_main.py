import pytest
from fastapi.testclient import TestClient
from app.main import app  # Replace with your FastAPI app import

# Tear-Up: Create a TestClient instance
@pytest.fixture(scope="session")
def client():
    with TestClient(app) as client:
        yield client  # Provide the client to the test

# Example Test
def test_read_root(client):
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {'message': 'This is changed'}