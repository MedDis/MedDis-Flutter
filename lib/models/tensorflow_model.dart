// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:tflite_flutter/tflite_flutter.dart';

class ClassifierModel {
  Interpreter interpreter;

  List<int> inputShape;
  List<int> outputShape;

  TfLiteType inputType;
  TfLiteType outputType;

  ClassifierModel({
    required this.interpreter,
    required this.inputShape,
    required this.outputShape,
    required this.inputType,
    required this.outputType,
  });
}

class ClassifierCategory {
  String label;
  double score;
  ClassifierCategory({
    required this.label,
    required this.score,
  });

  Map<String, dynamic> toJson() {
    return {
      'predictLabel': label,
      'percentFloat': score,
    };
  }
}
