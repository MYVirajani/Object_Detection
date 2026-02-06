import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/detect_objects.dart';
import 'detection_event.dart';
import 'detection_state.dart';

class DetectionBloc extends Bloc<DetectionEvent, DetectionState> {
  final DetectObjects detectObjects;

  DetectionBloc(this.detectObjects) : super(DetectionInitial()) {
    on<DetectImageEvent>((event, emit) async {
      emit(DetectionLoading());
      try {
        final response = await detectObjects(event.image);
        emit(DetectionLoaded(response));
      } catch (e) {
        emit(DetectionError(e.toString()));
      }
    });
  }
}

