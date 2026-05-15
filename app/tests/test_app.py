from fastapi.testclient import TestClient
from main import app

client = TestClient(app)


def test_root():
    response = client.get("/")
    assert response.status_code == 200


def test_health():
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json()["status"] == "healthy"


def test_version():
    response = client.get("/version")
    assert response.status_code == 200

def test_config():
    response = client.get("/config")
    assert response.status_code == 200
    assert "environment" in response.json()
    assert "version" in response.json()