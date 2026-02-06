import '../../data/models/detection_response_model.dart';
import '../repositories/detection_repository.dart';
import 'dart:io';

class DetectObjects {
  final DetectionRepository repository;

  DetectObjects(this.repository);

  Future<DetectionResponseModel> call(File image) {
    return repository.detectObjects(image); //
  }
}

