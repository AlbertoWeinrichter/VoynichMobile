import 'package:voynich_mobile/widgets/buttons/custom_raised_button.dart';
import 'package:flutter/material.dart';


class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String assetName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) : assert(text != null),
       assert(assetName != null), // we can chain some tests here
       super(
            child: Row(
              // alt + enter magic wrap with row
              // to put more than one object in a line
              // aligned with MainAxisAlignment.spaceBetween and an
              // invisible image of the same size. Space between makes it
              // symetrical and then we hide the right one
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(assetName),
                Text(
                  text,
                  style: TextStyle(color: textColor, fontSize: 15.0),
                ),
                Opacity(
                  child: Image.asset(assetName),
                  opacity: 0.0,
                )
              ],
            ),
            color: color,
            onPressed: onPressed);
}
