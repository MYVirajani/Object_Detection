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
      label: json['label'] ?? '',
      confidence: (json['confidence'] as num?)?.toDouble() ?? 0.0,
      x: (json['x'] as num?)?.toDouble() ?? 0.0,
      y: (json['y'] as num?)?.toDouble() ?? 0.0,
      width: (json['width'] as num?)?.toDouble() ?? 0.0,
      height: (json['height'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
