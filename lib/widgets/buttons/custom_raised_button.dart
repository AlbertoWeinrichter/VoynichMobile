import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  // This is how a constructor and args are declared
  // values here will be used by default if a new element is tot given as arg
  // inside a stateles widget all should be final

  CustomRaisedButton({
    this.child,
    this.color,
    this.borderRadius: 2.0,
    this.height: 50.0,
    this.onPressed,
  }) : assert(borderRadius != null);
  // this kind of assertion checks make it all safer and
  // faster to debug
  final Widget child;
  final Color color;
  final double borderRadius;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        child: child,
        color: color,
        disabledColor: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        onPressed: onPressed,
      ),
    );
  }
}
