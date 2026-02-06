import 'dart:io';
import '../../domain/repositories/detection_repository.dart';
import '../datasources/mlkit_datasource.dart';
import '../models/detection_response_model.dart';

class DetectionRepositoryImpl implements DetectionRepository {
  final MLKitDataSource dataSource;

  DetectionRepositoryImpl(this.dataSource);

  @override
  Future<DetectionResponseModel> detectObjects(File image) async {
    return await dataSource.detect(image);
  }
}
