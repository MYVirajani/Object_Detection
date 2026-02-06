import '../../data/models/detection_response_model.dart';
import '../../domain/entities/detected_object.dart';

abstract class DetectionState {}

class DetectionInitial extends DetectionState {}

class DetectionLoading extends DetectionState {}

class DetectionLoaded extends DetectionState {
  final DetectionResponseModel response;
  DetectionLoaded(this.response);
}

class DetectionError extends DetectionState {
  final String message;
  DetectionError(this.message);
}
