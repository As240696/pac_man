import 'package:flutter/material.dart';

class MyPixel extends StatelessWidget {
  dynamic outerColor;
  dynamic innerColor;
  dynamic pixelSize;
  dynamic child;

  MyPixel({this.outerColor, this.innerColor, this.pixelSize, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pixelSize,
      child: Container(
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: outerColor,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: innerColor,
          ),
          child: child,
        ),
      ),
    );
  }
}
