from pydantic import BaseModel
from typing import List

class Detection(BaseModel):
    label: str
    confidence: float
    x: int
    y: int
    width: int
    height: int

class DetectionResponse(BaseModel):
    count: int
    avg_conf: float
    detections: List[Detection]
