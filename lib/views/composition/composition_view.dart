import 'package:flutter/material.dart';
import 'package:gsc/view_model/state/composition_provider.dart';
import 'package:gsc/views/auth/widget/full_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CompositionView extends StatelessWidget {
  const CompositionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Composition"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FullButton(
              marginTop: 0,
              marginBottom: 0,
              secondaryColor: true,
              onPressed: () {
                logicButton(context, isCamera: false);
              },
              text: "Scan with Gallery",
            ),
            FullButton(
              onPressed: () {
                logicButton(context, isCamera: true);
              },
              text: "Scan with Camera",
            ),
          ],
        ),
      ),
    );
  }

  void logicButton(BuildContext context, {required bool isCamera}) {
    final prov = Provider.of<CompositionProvider>(context, listen: false);
    prov
        .pickImage(image: isCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) => {
              if (value != '')
                {
                  prov.imageCropperView(context, value).then((value) {
                    if (value != '') {
                      prov.processImage(value);
                    }
                  })
                }
            });
  }
}
