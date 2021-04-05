import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  final double size;
  final Color colour;
  final TextDecoration textDecoration;
  Txt(
      {this.colour,
      this.fontWeight,
      this.size,
      @required this.title,
      this.textDecoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: colour,
        fontSize: size,
        fontWeight: fontWeight,
        decoration: textDecoration,
      ),
    );
  }
}
