import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:gsc/models/tensorflow_model.dart';
import 'package:gsc/view_model/state/classifier_provider.dart';
import 'package:gsc/view_model/state/composition_provider.dart';
import 'package:gsc/view_model/state/disease_provider.dart';
import 'package:gsc/views/auth/widget/full_button.dart';
import 'package:gsc/views/composition/composition_output.dart';
import 'package:gsc/views/disease/disease_screen.dart';
import 'package:gsc/views/disease/recomendation_doctor_card.dart';
import 'package:gsc/views/doctor/doctor_view.dart';
import 'package:gsc/views/home/widget/menu_cards.dart';
import 'package:gsc/views/human_body/human_body_screen.dart';
import 'package:gsc/widgets/custom_search_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:image/image.dart' as img;
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

enum CardEnums {
  composition,
  skinDisease,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SwipeableCardSectionController _cardController =
      SwipeableCardSectionController();

  // List<Widget> dataDoctor = [
  //   const SizedBox(
  //     height: 300,
  //     child: Card(
  //       child: Text("Card 1"),
  //     ),
  //   ),
  //   const SizedBox(
  //     height: 300,
  //     child: Card(
  //       child: Text("Card 2"),
  //     ),
  //   ),
  //   const SizedBox(
  //     height: 300,
  //     child: Card(
  //       child: Text("Card 3"),
  //     ),
  //   ),
  // ];

  void showAlertDialog(CardEnums cardEnums) {
    showDialog(
      context: context,
      builder: (context) {
        final size = MediaQuery.of(context).size;
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          backgroundColor: Colors.white,
          content: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                FullButton(
                  marginTop: 5,
                  marginBottom: 0,
                  width: size.width * 0.58,
                  height: 40,
                  onPressed: () {
                    if (cardEnums == CardEnums.composition) {
                      logicButtonComposition(isCamera: true);
                    } else {
                      logicButtonSkinDisease(isCamera: true);
                    }
                  },
                  text: "Scan with Camera",
                ),
                FullButton(
                  marginTop: 10,
                  marginBottom: 0,
                  width: size.width * 0.58,
                  height: 40,
                  secondaryColor: true,
                  onPressed: () {
                    if (cardEnums == CardEnums.composition) {
                      logicButtonComposition(isCamera: false);
                    } else {
                      logicButtonSkinDisease(isCamera: false);
                    }
                  },
                  text: "Scan with Gallery",
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final prov = Provider.of<DiseaseProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title:
            // Text(
            //   "MedDis",
            //   style: TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.w700,
            //   ),
            // ),
            SizedBox(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/meddis_logo.png",
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "MedDis",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  // color: primary
                ),
              ),
            ],
          ),
        ),
        shadowColor: Colors.black,
        backgroundColor: const Color(0xFFF5F5F5),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 1 / 16),
              child: const CustomSearchBar(),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SwipeableCardsSection(
                    cardController: _cardController,
                    context: context,
                    items: List.generate(
                      3,
                      (index) => RecomendationDoctorCard(
                        dataDoctor: prov.listDoctor[index],
                      ),
                    ),
                    cardHeightTopMul: 0.14,
                    cardHeightMiddleMul: 0.09,
                    cardHeightBottomMul: 0.1,
                    enableSwipeUp: true,
                    enableSwipeDown: false,
                    onCardSwiped: (dir, index, widget) {
                      _cardController.addItem(
                        RecomendationDoctorCard(
                          dataDoctor: prov.listDoctor[index % 3],
                        ),
                      );

                      //Take action on the swiped widget based on the direction of swipe
                      //Return false to not animate cards
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 1 / 16),
              child: const Text(
                "Menu",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 1 / 16),
                child: LayoutGrid(
                  columnSizes: [1.fr, 1.fr],
                  rowSizes: const [auto, auto],
                  rowGap: 8,
                  columnGap: 8,
                  children: [
                    MenuCards(
                      onTap: () {
                        showAlertDialog(CardEnums.composition);
                      },
                      title: "Composition",
                      images: "assets/images/composition_card.png",
                    ),
                    MenuCards(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HumanBodyScreen(),
                        ),
                      ),
                      isPrimaryColors: false,
                      title: "Human Body",
                      images: "assets/images/human_body_card.png",
                    ),
                    MenuCards(
                      onTap: () {},
                      isPrimaryColors: false,
                      title: "Med Bot",
                      images: "assets/images/med_bot_card.png",
                    ),
                    MenuCards(
                      onTap: () {
                        showAlertDialog(CardEnums.skinDisease);
                      },
                      title: "Skin Disease",
                      images: "assets/images/skin_disease_card.png",
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void logicButtonComposition({required bool isCamera}) {
    final prov = Provider.of<CompositionProvider>(context, listen: false);
    prov
        .pickImage(image: isCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) => {
              if (value != '')
                {
                  prov.imageCropperView(context, value).then(
                    (value) {
                      if (value != '') {
                        prov.processImage(value);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CompositionOutput(),
                          ),
                        );
                      }
                    },
                  )
                }
            });
  }

  void logicButtonSkinDisease({required bool isCamera}) {
    pickImage(imageSource: isCamera ? ImageSource.camera : ImageSource.gallery)
        .then(
      (path) async {
        if (path != '') {
          final prov = Provider.of<ClassifierProvider>(context, listen: false);

          // Load Model
          final model = await prov.loadModel();

          //Load preprocessInput
          File iniFile = File(path);
          img.Image image = img.decodeImage(iniFile.readAsBytesSync())!;
          TensorImage inputImage = prov.preProcessInput(image, model);

          debugPrint(
            'Pre-processed image: ${inputImage.width}x${image.height}, '
            'size: ${inputImage.buffer.lengthInBytes} bytes',
          );

          final outputBuffer = TensorBuffer.createFixedSize(
            model.outputShape,
            model.outputType,
          );

          model.interpreter.run(inputImage.buffer, outputBuffer.buffer);
          debugPrint('OutputBuffer: ${outputBuffer.getDoubleList()}');

          // PostProcess data
          List<ClassifierCategory> listData =
              prov.postProcessOutput(outputBuffer);

          // Predict
          ClassifierCategory topResult =
              prov.predict(inputImage, model, listData);

          await Provider.of<DiseaseProvider>(context, listen: false)
              .validateDisease(topResult.label)
              .then(
                (value) => {
                  if (value.name != null)
                    {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) =>
                              DiseaseScreen(path: path, predictData: value),
                        ),
                      ),
                    }
                },
              );
        }
      },
    );
  }

  Future<String> pickImage({required ImageSource? imageSource}) async {
    final ImagePicker picker = ImagePicker();
    String path = '';

    try {
      final XFile? pickedFile = await picker.pickImage(
        source: imageSource!,
      );
      if (pickedFile != null) {
        path = pickedFile.path;
      } else {
        path = '';
      }
    } catch (e) {
      e.toString();
    }
    return path;
  }
}
