import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CompositionProvider extends ChangeNotifier {
  String data = '';

  Future<String> pickImage({ImageSource? image}) async {
    final picker = ImagePicker();

    String path = '';

    try {
      final getImage = await picker.pickImage(source: image!);
      if (getImage != null) {
        path = getImage.path;
      } else {
        path = '';
      }
    } catch (e) {
      e.toString();
    }
    return path;
  }

  Future<String> imageCropperView(BuildContext context, String? path) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: path!,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );

    if (croppedFile != null) {
      print(croppedFile.path);
      return croppedFile.path;
    } else {
      return '';
    }
  }

  void processImage(String path) async {
    final InputImage inputImage = InputImage.fromFilePath(path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    data = recognizedText.text;
    // print(data);
    final splitData = data.split(' ');
    // print(splitData);
    LineSplitter ls = const LineSplitter();
    List<String> lines = ls.convert(data);
    // print(lines[1]);
    print(lines);
    notifyListeners();
  }
}
