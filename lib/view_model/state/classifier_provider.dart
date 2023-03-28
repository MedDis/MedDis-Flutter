import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gsc/models/tensorflow_model.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:image/image.dart' as img;

class ClassifierProvider with ChangeNotifier {
  final int _labelsLength = 9;
  String labelAssets = "assets/labels.txt";
  String model = "skinDisease.tflite";
  late List<String> _labels;

  Future<List<String>> loadLabels() async {
    // Loads the labels using the file utility from tflite_flutter_helper.
    final rawLabels = await FileUtil.loadLabels(labelAssets);

    if (rawLabels.length == _labelsLength) {
      debugPrint('Labels loaded successfully');
    } else {
      debugPrint('Unable to load labels');
    }

    _labels = rawLabels;
    return rawLabels;
  }

  Future<ClassifierModel> loadModel() async {
    // Creates an interpreter with the provided model file.
    // The interpreter is a tool to predict the result.
    final interpreter = await Interpreter.fromAsset(model);

    // Read the input and output shapes
    final inputShape = interpreter.getInputTensor(0).shape;
    final outputShape = interpreter.getOutputTensor(0).shape;

    debugPrint('Input shape: $inputShape');
    debugPrint('Output shape: $outputShape');

    // Read the input and output types
    final inputType = interpreter.getInputTensor(0).type;
    final outputType = interpreter.getOutputTensor(0).type;

    debugPrint('Input type: $inputType');
    debugPrint('Output type: $outputType');

    return ClassifierModel(
      interpreter: interpreter,
      inputShape: inputShape,
      outputShape: outputShape,
      inputType: inputType,
      outputType: outputType,
    );
  }

  TensorImage preProcessInput(img.Image image, ClassifierModel model) {
    // Create the TensorImage
    final inputTensor = TensorImage(model.inputType);
    inputTensor.loadImage(image);

    // Crop the image to a square shape.
    final minLength = min(inputTensor.height, inputTensor.width);
    final cropOp = ResizeWithCropOrPadOp(minLength, minLength);

    // Resize the image operation to fit the shape requirements of the model.
    final shapeLength = model.inputShape[1];
    final resizeOp = ResizeOp(shapeLength, shapeLength, ResizeMethod.BILINEAR);

    // Normalize the value of the data.
    final normalizeOp = NormalizeOp(127.5, 127.5);

    // Create the image processor with the defined operation and preprocess the image.
    final imageProcessor = ImageProcessorBuilder()
        .add(cropOp)
        .add(resizeOp)
        .add(normalizeOp)
        .build();

    imageProcessor.process(inputTensor);
    return inputTensor;
  }

  List<ClassifierCategory> postProcessOutput(TensorBuffer outputBuffer) {
    // Create an instance of TensorProcessorBuilder to parse and process the output.
    final probabilityProcessor = TensorProcessorBuilder().build();

    probabilityProcessor.process(outputBuffer);

    // Map output values to labels.

    final labelledResult = TensorLabel.fromList(_labels, outputBuffer);

    // Build category instances with the list of label & score records.
    final categoryList = <ClassifierCategory>[];
    labelledResult.getMapWithFloatValue().forEach((key, value) {
      final category = ClassifierCategory(label: key, score: value);
      categoryList.add(category);
    });

    // Sort the list to place the most likely result at the top.
    categoryList.sort((a, b) => (b.score > a.score ? 1 : -1));

    return categoryList;
  }

  ClassifierCategory predict(TensorImage inputImage, ClassifierModel model,
      List<ClassifierCategory> resultCategories) {
    // Define the output buffer
    final outputBuffer = TensorBuffer.createFixedSize(
      model.outputShape,
      model.outputType,
    );

    // Run inference
    model.interpreter.run(inputImage.buffer, outputBuffer.buffer);

    // Post Process the outputBuffer
    final topResult = resultCategories.first;

    debugPrint('Top category: $topResult');

    return topResult;
  }
}
