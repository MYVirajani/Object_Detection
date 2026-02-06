import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/detection_bloc.dart';
import '../bloc/detection_event.dart';
import '../bloc/detection_state.dart';

class ObjectDetectionPage extends StatefulWidget {
  const ObjectDetectionPage({super.key});

  @override
  State<ObjectDetectionPage> createState() => _ObjectDetectionPageState();
}

class _ObjectDetectionPageState extends State<ObjectDetectionPage> {
  File? image;
  final picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final picked = await picker.pickImage(source: source);
    if (picked != null) {
      image = File(picked.path);
      context.read<DetectionBloc>().add(DetectImageEvent(image!));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Smart Object Detection")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => pickImage(ImageSource.camera),
                child: const Text("Camera"),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () => pickImage(ImageSource.gallery),
                child: const Text("Gallery"),
              ),
            ],
          ),

          if (image != null)
            Image.file(image!, height: 250),

          BlocBuilder<DetectionBloc, DetectionState>(
            builder: (context, state) {
              if (state is DetectionLoading) {
                return const CircularProgressIndicator();
              }
              if (state is DetectionLoaded) {
                final response = state.response;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Label: ${response.detections.isNotEmpty ? response.detections[0].label : 'N/A'}"),
                    SizedBox(height: 5),
                    Text("Total Objects: ${response.count}"),
                    SizedBox(height: 5),
                    Text("Average Confidence: ${response.avgConf.toStringAsFixed(2)}"),
                  ],
                );
              }

              if (state is DetectionError) {
                return Text(state.message);
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
