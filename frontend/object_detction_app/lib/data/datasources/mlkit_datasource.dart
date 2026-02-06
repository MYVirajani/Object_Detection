import 'dart:io';
import 'package:dio/dio.dart';
import '../models/detected_object_model.dart';
import '../models/detection_response_model.dart';

class MLKitDataSource {
  final Dio dio;

  MLKitDataSource(this.dio);

  Future<DetectionResponseModel> detect(File image) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(image.path),
    });

    final response = await dio.post(
      'http://10.0.2.2:8000/api/detect',
      data: formData,
    );

    return DetectionResponseModel.fromJson(response.data);
  }
}
