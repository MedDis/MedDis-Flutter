import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton(
      {Key? key,
      this.onTap,
      this.buttonName,
      this.marginTop = 15,
      this.marginBottom = 15})
      : super(key: key);
  final Function? onTap;
  final String? buttonName;
  final double marginTop;
  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 55,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 14,
      ),
      margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(40))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/google_logo.png",
            height: 60,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            '$buttonName with Google',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
