# 🧠 Smart Object Detection App

A full-stack AI-powered mobile application that performs object
detection using **YOLOv8** and displays results in a **Flutter** mobile
app built with Clean Architecture and BLoC pattern.

------------------------------------------------------------------------

## 🚀 Project Overview

Smart Object Detection App allows users to:

-   📸 Capture an image using the camera
-   🖼️ Select an image from the gallery
-   🤖 Send image to a FastAPI backend
-   🔍 Detect objects using YOLOv8
-   📦 Display bounding boxes in Flutter
-   📊 Show total detected count and average confidence

------------------------------------------------------------------------

## 🏗️ Architecture

### 🔹 Backend (FastAPI + YOLOv8)

    backend/
    │── app/
    │   ├── main.py
    │   ├── routes/
    │   │     └── detect.py
    │   ├── services/
    │   │     └── detector.py
    │   ├── schemas/
    │   │     └── response.py
    │   ├── models/
    │   │     └── yolov8n.pt
    │── requirements.txt

### 🔹 Frontend (Flutter - Clean Architecture)

    lib/
    ├── presentation/
    ├── domain/
    ├── data/
    └── main.dart

Flutter uses: 
- Clean Architecture
- BLoC State Management
- Repository Pattern

------------------------------------------------------------------------

## 🛠️ Tech Stack

### Backend

-   FastAPI
-   Uvicorn
-   Ultralytics YOLOv8
-   OpenCV
-   NumPy
-   Pydantic

### Frontend

-   Flutter
-   flutter_bloc
-   image_picker
-   http

------------------------------------------------------------------------

## 🔄 How It Works

1.  User selects or captures image in Flutter
2.  Image is sent to FastAPI (`/api/detect`)
3.  YOLOv8 processes image
4.  Backend returns:
    -   Detected objects
    -   Count
    -   Average confidence
5.  Flutter draws bounding boxes on image

------------------------------------------------------------------------

