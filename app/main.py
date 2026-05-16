from fastapi import FastAPI
from fastapi.responses import JSONResponse

app = FastAPI(title="DevSecOps Demo Application")


@app.get("/")
def root():
    return JSONResponse(
        content={
            "message": "DevSecOps Demo Application 🚀",
            "description": "Aplicación desplegada exitosamente con CI/CD, Docker, ECR y ECS Fargate.",
            "encoding": "UTF-8"
        },
        media_type="application/json; charset=utf-8"
    )


@app.get("/health")
def health():
    return {
        "status": "healthy"
    }