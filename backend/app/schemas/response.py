from pydantic import BaseModel
from typing import List

class Detection(BaseModel):
    label: str
    confidence: float
    box: List[int]  # [x1, y1, x2, y2]

class DetectionResponse(BaseModel):
    objects: List[Detection]
