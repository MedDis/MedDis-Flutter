import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.controller,
    this.title = '',
    this.textHint = '',
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
  }) : super(key: key);
  final TextEditingController controller;
  final String title;
  final String textHint;
  final int maxLines;
  final int minLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 5,
          ),
          Card(
            elevation: 3,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: TextFormField(
              controller: controller,
              maxLines: maxLines,
              minLines: minLines,
              maxLength: maxLength,
              maxLengthEnforcement:
                  (maxLength == null) ? null : MaxLengthEnforcement.enforced,
              style: const TextStyle(
                // fontStyle: titleSmall.fontStyle,
                // fontSize: titleSmall.fontSize,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: textHint,
                // hintStyle: hintTitle,
                contentPadding: EdgeInsets.symmetric(
                  vertical: size.height * 7 / 400,
                  horizontal: size.width * 1 / 22,
                ),
                isDense: true,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
