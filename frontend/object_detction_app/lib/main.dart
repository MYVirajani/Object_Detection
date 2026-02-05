import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'data/datasources/mlkit_datasource.dart';
import 'data/repositories/detection_repository_impl.dart';
import 'domain/usecases/detect_objects.dart';
import 'presentation/bloc/detection_bloc.dart';
import 'presentation/pages/object_detection_page.dart';

void main() {
  final dio = Dio();
  final dataSource = MLKitDataSource(dio);
  final repository = DetectionRepositoryImpl(dataSource);
  final usecase = DetectObjects(repository);

  runApp(MyApp(usecase));
}

class MyApp extends StatelessWidget {
  final DetectObjects usecase;

  const MyApp(this.usecase, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => DetectionBloc(usecase),
        child: const ObjectDetectionPage(),
      ),
    );
  }
}
