import '../entities/detected_object.dart';
import 'dart:io';

abstract class DetectionRepository {
  Future<List<DetectedObject>> detectObjects(File image);
}
