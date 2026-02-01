# app/services/detector.py
import torch
import cv2
import numpy as np
from PIL import Image

model = torch.hub.load(
    'ultralytics/yolov5',
    'yolov5s',
    pretrained=True
)

def detect_objects(image: Image.Image):
    img = np.array(image)
    results = model(img)
    detections = []

    for *box, conf, cls in results.xyxy[0]:
        detections.append({
            "label": model.names[int(cls)],
            "confidence": float(conf),
            "box": [
                int(box[0]), int(box[1]),
                int(box[2]), int(box[3])
            ]
        })

    return detections
