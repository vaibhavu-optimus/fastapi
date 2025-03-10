from fastapi import FastAPI
from pydantic import BaseModel

# Initialize the FastAPI app
app = FastAPI()

# Define a Pydantic model for the request body
class NameRequest(BaseModel):
    name: str

# Health check route
@app.get("/health")
def health_check():
    return {"status": "healthy"}

# Greet the user by name
@app.post("/greet")
def greet_user(request: NameRequest):
    return {"message": f"Hello, {request.name}!"}
