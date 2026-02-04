import '../../domain/entities/detected_object.dart';

class DetectedObjectModel extends DetectedObject {
  DetectedObjectModel({
    required super.label,
    required super.confidence,
    required super.x,
    required super.y,
    required super.width,
    required super.height,
  });

  factory DetectedObjectModel.fromJson(Map<String, dynamic> json) {
    return DetectedObjectModel(
      label: json['label'],
      confidence: json['confidence'].toDouble(),
      x: json['x'].toDouble(),
      y: json['y'].toDouble(),
      width: json['width'].toDouble(),
      height: json['height'].toDouble(),
    );
  }
}
