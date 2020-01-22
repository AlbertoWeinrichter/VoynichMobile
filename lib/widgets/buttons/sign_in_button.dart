import 'package:voynich_mobile/widgets/buttons/custom_raised_button.dart';
import 'package:flutter/material.dart';


class SignInButton extends CustomRaisedButton {
  SignInButton({
    String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(text != null),
        super(
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 15.0),
            ),
            color: color,
            height: 40,
            onPressed: onPressed);
}
