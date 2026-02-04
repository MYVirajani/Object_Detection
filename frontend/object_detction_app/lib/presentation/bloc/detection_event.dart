import 'dart:io';

abstract class DetectionEvent {}

class DetectImageEvent extends DetectionEvent {
  final File image;
  DetectImageEvent(this.image);
}
