import 'dart:io';
import '../../domain/entities/detected_object.dart';
import '../../domain/repositories/detection_repository.dart';
import '../datasources/mlkit_datasource.dart';

class DetectionRepositoryImpl implements DetectionRepository {
  final MLKitDataSource dataSource;

  DetectionRepositoryImpl(this.dataSource);

  @override
  Future<List<DetectedObject>> detectObjects(File image) {
    return dataSource.detect(image);
  }
}
