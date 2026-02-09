from ultralytics import YOLO
import cv2
import numpy as np

model = YOLO("app/models/yolov8m.pt")

def detect_objects(image_bytes: bytes):

    np_img = np.frombuffer(image_bytes, np.uint8)
    image = cv2.imdecode(np_img, cv2.IMREAD_COLOR)

    results = model(image, conf=0.6, iou=0.5)

    detections = []
    confidences = []

    for r in results:
        for box in r.boxes:
            x1, y1, x2, y2 = map(int, box.xyxy[0])
            confidence = float(box.conf[0])
            class_id = int(box.cls[0])
            label = model.names[class_id]

            width = x2 - x1
            height = y2 - y1

            detections.append({
                "label": label,
                "confidence": round(confidence, 2),
                "x": x1,
                "y": y1,
                "width": width,
                "height": height
            })

            confidences.append(confidence)

    count = len(detections)
    avg_conf = round(sum(confidences) / count, 2) if count > 0 else 0.0

    return {
        "count": count,
        "avg_conf": avg_conf,
        "detections": detections
    }
