# app/main.py
from fastapi import FastAPI
from app.routes.detect import router

app = FastAPI(title="Smart Object Detection API")

app.include_router(router)

@app.get("/")
def health():
    return {"status": "API running"}
