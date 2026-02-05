import 'package:flutter/material.dart';
import '../../domain/entities/detected_object.dart';

class BoundingBox extends StatelessWidget {
  final DetectedObject object;

  const BoundingBox({super.key, required this.object});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: object.x,
      top: object.y,
      width: object.width,
      height: object.height,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 2),
        ),
        child: Text(
          "${object.label} ${(object.confidence * 100).toStringAsFixed(1)}%",
          style: const TextStyle(
            backgroundColor: Colors.red,
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
