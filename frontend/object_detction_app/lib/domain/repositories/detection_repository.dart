import '../../data/models/detection_response_model.dart';
import 'dart:io';

abstract class DetectionRepository {
  Future<DetectionResponseModel> detectObjects(File image);
}
