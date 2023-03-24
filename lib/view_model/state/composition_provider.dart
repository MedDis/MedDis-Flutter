import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuzzywuzzy/fuzzywuzzy.dart';
import 'package:fuzzywuzzy/model/extracted_result.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:gsc/utils/finite_state.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CompositionProvider with ChangeNotifier, FiniteState {
  String data = '';
  final List<String> _similarDrug = [];
  List<String> _processedData = [];
  List<String> dummyData = ["Chrom", "paractmol"];

  List<String?> get processedData => _processedData;

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
      return croppedFile.path;
    } else {
      return '';
    }
  }

  Future<void> processImage(String path) async {
    final InputImage inputImage = InputImage.fromFilePath(path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    _processedData.clear();

    List<String> wordsAfterCheckUnnecessary = [];
    // Load data all drugs from assets
    final dataFromAsset = await loadAsset("assets/drugs.txt");
    final dataUnnecessaryWords =
        await loadAsset("assets/unnecessary_words.txt");

    setStateAction(StateAction.loading);
    try {
      // Text Recognizer (OCR)
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);
      data = recognizedText.text;

      // Line Split
      LineSplitter ls = const LineSplitter();
      List<String> lines = ls.convert(data);

      // Check unnecessary words
      Iterable<Future<void>> resultUnnecessaryWords = lines.map(
        (drug) async {
          final a = checkUnnecessaryWords(drug, dataUnnecessaryWords);
          if (a != '') {
            wordsAfterCheckUnnecessary.add(a);
          }
        },
      );

      // Waiting for the check of unnecessary words.
      Future<List<void>> futureListUnncessaryWords =
          Future.wait(resultUnnecessaryWords);
      await futureListUnncessaryWords;

      // Check Similarity with FuzzyWuzzy
      Iterable<Future<String>> resultCheckSimilarity =
          wordsAfterCheckUnnecessary.map(
        (drug) async {
          final a = checkSimilarity(drug, dataFromAsset);
          return a;
        },
      );
      Future<List<String>> futureList = Future.wait(resultCheckSimilarity);
      _processedData = await futureList;
      await Future.delayed(const Duration(seconds: 2));
      setStateAction(StateAction.none);
    } catch (e) {
      setStateAction(StateAction.error);
    }
    notifyListeners();
  }

  String checkUnnecessaryWords(String drug, List<String> dataUnnecessaryWords) {
    // Fuzzywuzzy with unnecessary words
    ExtractedResult<String> result = extractOne(
      query: drug,
      choices: dataUnnecessaryWords,
      cutoff: 10,
    );

    // A condition where unnecessary words are found
    if (result.score <= 80) {
      return drug;
    } else {
      return '';
    }
  }

  String checkSimilarity(String drug, List<String> dataFromAsset) {
    List multipleWords = drug.split(' ');

    // Fuzzywuzzy with top 20
    List<ExtractedResult<String>> result = extractTop(
      query: drug,
      choices: dataFromAsset,
      cutoff: 10,
      limit: 20,
    )..map((e) => _similarDrug.add(e.choice)).toList();
    // Condition if drug words has multiple word
    if (multipleWords.length == 2 && result[0].score <= 90) {
      // Second check similarity with fuzzy wuzzy
      final dataDoubleString = checkDoubleString(drug);
      return dataDoubleString;
    } else {
      return result[0].choice;
    }
  }

  Future<List<String>> loadAsset(String assets) async {
    String data = await rootBundle.loadString(assets);
    LineSplitter textLineSplitter = const LineSplitter();
    List<String> lines = textLineSplitter.convert(data);
    return lines;
  }

  String checkDoubleString(String drug) {
    List drugSplit = drug.split(' ');
    String firstDrugWords = '';
    ExtractedResult<String> firstResult = extractOne(
      query: drugSplit[0],
      choices: _similarDrug,
      cutoff: 10,
    );
    firstDrugWords = firstResult.choice;
    ExtractedResult<String> secondResult = extractOne(
      query: "$firstDrugWords ${drugSplit[1]}",
      choices: _similarDrug,
      cutoff: 10,
    );
    return secondResult.choice;
  }
}
