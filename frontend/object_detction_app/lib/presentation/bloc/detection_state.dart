import '../../domain/entities/detected_object.dart';

abstract class DetectionState {}

class DetectionInitial extends DetectionState {}

class DetectionLoading extends DetectionState {}

class DetectionLoaded extends DetectionState {
  final List<DetectedObject> objects;
  DetectionLoaded(this.objects);
}

class DetectionError extends DetectionState {
  final String message;
  DetectionError(this.message);
}
