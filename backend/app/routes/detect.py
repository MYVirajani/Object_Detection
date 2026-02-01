# app/routes/detect.py
from fastapi import APIRouter, File, UploadFile
from PIL import Image
from app.services.detector import detect_objects
import io

router = APIRouter()

@router.post("/detect")
async def detect(file: UploadFile = File(...)):
    image_bytes = await file.read()
    image = Image.open(io.BytesIO(image_bytes))
    results = detect_objects(image)

    return {"objects": results}
