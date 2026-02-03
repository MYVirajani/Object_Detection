from ultralytics import YOLO
import cv2
import numpy as np

# Load YOLO model once
model = YOLO("app/models/yolov8n.pt")

def detect_objects(image_bytes: bytes):
    # Convert bytes to OpenCV image
    np_img = np.frombuffer(image_bytes, np.uint8)
    image = cv2.imdecode(np_img, cv2.IMREAD_COLOR)

    # Run inference
    results = model(image)

    detections = []

    for r in results:
        for box in r.boxes:
            x1, y1, x2, y2 = map(int, box.xyxy[0])
            confidence = float(box.conf[0])
            class_id = int(box.cls[0])
            label = model.names[class_id]

            detections.append({
                "label": label,
                "confidence": round(confidence, 2),
                "box": [x1, y1, x2, y2]
            })

    return detections
