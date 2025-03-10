import sys  # Import sys
import os  # Import os
import pytest
from fastapi.testclient import TestClient

# Adds the parent directory to sys.path so the app module can be found
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../')))

from app.app import app  # Adjusted import for app in the 'app' folder

# Create a TestClient to simulate requests to the FastAPI app
client = TestClient(app)

def test_health_check():
    # Test the health check route
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json() == {"status": "healthy"}

def test_greet_user():
    # Test the greet user route with a valid name
    response = client.post("/greet", json={"name": "Alice"})
    assert response.status_code == 200
    assert response.json() == {"message": "Hello, Alice!"}

    # Test the greet user route with another valid name
    response = client.post("/greet", json={"name": "Bob"})
    assert response.status_code == 200
    assert response.json() == {"message": "Hello, Bob!"}
