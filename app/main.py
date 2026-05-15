from fastapi import FastAPI
import os

app = FastAPI()

VERSION = os.getenv("APP_VERSION", "1.0.0")
ENVIRONMENT = os.getenv("APP_ENV", "dev")


@app.get("/")
def root():
    return {
        "message": "Prueba Técnica DevSecOps - DaviPlata",
        "environment": ENVIRONMENT
    }


@app.get("/health")
def health():
    return {
        "status": "healthy"
    }


@app.get("/version")
def version():
    return {
        "version": VERSION
    }

@app.get("/config")
def config():
    return {
        "environment": ENVIRONMENT,
        "version": VERSION
    }