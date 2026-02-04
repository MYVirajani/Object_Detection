import 'dart:io';
import '../entities/detected_object.dart';
import '../repositories/detection_repository.dart';

class DetectObjects {
  final DetectionRepository repository;

  DetectObjects(this.repository);

  Future<List<DetectedObject>> call(File image) {
    return repository.detectObjects(image);
  }
}
