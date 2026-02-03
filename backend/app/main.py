from fastapi import FastAPI
from app.routes.detect import router as detect_router

app = FastAPI(
    title="Smart Object Detection API",
    version="1.0.0"
)

app.include_router(detect_router, prefix="/api")

@app.get("/")
def root():
    return {"message": "Smart Object Detection API is running"}
