import 'package:flutter/material.dart';

import 'package:loan_calculator/widgets/colors.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class Sliders extends StatelessWidget {
  final List<FlutterSliderHatchMarkLabel> labels;
  final double min;
  final double max;
  final double amount;
  final Function calculate;
  Sliders({
    this.amount,
    this.calculate,
    this.max,
    this.min,
    this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterSlider(
      values: [amount],
      onDragging: calculate,
      max: max,
      min: min,
      hatchMark: FlutterSliderHatchMark(
          labelsDistanceFromTrackBar: 50, density: 0.5, labels: labels),
      handler: FlutterSliderHandler(
        decoration: BoxDecoration(),
        child: Material(
          type: MaterialType.circle,
          color: Colors.white,
          child: Container(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.circle,
                size: 15,
                color: black,
              )),
        ),
      ),
      trackBar: FlutterSliderTrackBar(
        inactiveTrackBarHeight: 2,
        activeTrackBarHeight: 6,
        inactiveTrackBar: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: grey,
        ),
        activeTrackBar: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              darkBlue,
              blue,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0, 1],
          ),
        ),
      ),
    );
  }
}
