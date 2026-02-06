// import '../../domain/entities/detected_object.dart';
// import 'detected_object_model.dart';
//
// class DetectionResponseModel {
//   final int count;
//   final double avgConf;
//   final List<DetectedObject> detections;
//
//   DetectionResponseModel({
//     required this.count,
//     required this.avgConf,
//     required this.detections,
//   });
//
//   factory DetectionResponseModel.fromJson(Map<String, dynamic> json) {
//     return DetectionResponseModel(
//       count: json['count'] ?? 0,
//       avgConf: (json['avg_conf'] as num?)?.toDouble() ?? 0.0,
//       detections: (json['detections'] as List?)
//           ?.map((e) => DetectedObjectModel.fromJson(e as Map<String, dynamic>))
//           .toList() ??
//           [],
//     );
//   }
// }

import 'detected_object_model.dart';

class DetectionResponseModel {
  final int count;
  final double avgConf;
  final List<DetectedObjectModel> detections; // <-- change here

  DetectionResponseModel({
    required this.count,
    required this.avgConf,
    required this.detections,
  });

  factory DetectionResponseModel.fromJson(Map<String, dynamic> json) {
    return DetectionResponseModel(
      count: json['count'] ?? 0,
      avgConf: (json['avg_conf'] as num?)?.toDouble() ?? 0.0,
      detections: (json['detections'] as List?)
          ?.map((e) => DetectedObjectModel.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
    );
  }
}
