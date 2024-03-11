import 'package:find_v2/utils/theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RaisedeButton extends StatelessWidget {
  late final String btntext;
  late Function onBtnPressed;

  // ignore: non_constant_identifier_names
  RaisedeButton({Key? Key, required this.btntext, required this.onBtnPressed})
      : super(key: Key);

  get lightgreenshede1 => null;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: skinFill,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        onPressed: () {
          onBtnPressed();
        },
        minWidth: 320,
        height: 60,
        child: Text(
          btntext,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
