from fastapi import APIRouter, UploadFile, File
from app.services.detector import detect_objects
from app.schemas.response import DetectionResponse

router = APIRouter()

@router.post("/detect", response_model=DetectionResponse)
async def detect(file: UploadFile = File(...)):
    image_bytes = await file.read()
    objects = detect_objects(image_bytes)
    return {"objects": objects}
