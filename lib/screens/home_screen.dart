import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

import '../widgets/Sliders.dart';
import '../widgets/colors.dart';
import '../widgets/txt.dart';
import '../widgets/loan_calculation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double loanAmount = 12000;
  double loanTerm = 24;
  double score = 760;
  double result = 30.00;

  double calculateLoanAmount(
      int handlerIndex, dynamic lowerValue, dynamic upperValue) {
    setState(() {
      loanAmount = lowerValue;
    });
    return loanAmount;
  }

  double calculateLoanTerm(
      int handlerIndex, dynamic lowerValue, dynamic upperValue) {
    setState(() {
      loanTerm = lowerValue;
    });
    return loanTerm;
  }

  double calculateScore(
      int handlerIndex, dynamic lowerValue, dynamic upperValue) {
    setState(() {
      score = lowerValue;
    });
    return score;
  }

  String calculatePayment() {
    result = loanAmount * (0.06 / loanTerm);
    return result.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: FlatButton(
            onPressed: () {
              setState(() {
                calculatePayment();
              });
            },
            child: Txt(
              size: 16,
              title: 'Start Your Application',
              colour: darkBlue,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 15),
            height: height * 0.37,
            width: double.infinity,
            decoration: BoxDecoration(
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
            child: Column(children: [
              Txt(
                title: 'Loan Calculator',
                colour: Colors.white,
                fontWeight: FontWeight.bold,
                size: 22,
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: height * 0.21,
                width: width * 0.85,
                decoration: BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: LoanCalCulation(result),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Txt(
                    title: 'Loan Amount',
                    colour: Colors.white,
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  Txt(
                    title: '\$${loanAmount.toString()}',
                    colour: Colors.white,
                    size: 20,
                  ),
                ]),
          ),
          Sliders(
            amount: loanAmount.toDouble(),
            calculate: calculateLoanAmount,
            min: 0,
            max: 20000,
            labels: [
              FlutterSliderHatchMarkLabel(
                  percent: 1, label: Txt(title: '-', size: 20, colour: grey)),
              FlutterSliderHatchMarkLabel(
                  percent: 15, label: Txt(title: '\$${3000}', colour: grey)),
              FlutterSliderHatchMarkLabel(
                  percent: 93, label: Txt(title: '\$${20000}', colour: grey)),
            ],
          ),
          FlatButton(
            onPressed: () {},
            child: Txt(
              title: 'Interested in a different amount?',
              colour: grey,
              textDecoration: TextDecoration.underline,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Loan Term ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '(months)',
                        style: TextStyle(
                          color: grey,
                          fontSize: 14,
                        )),
                  ])),
                  Txt(
                    title: loanTerm.toString(),
                    colour: Colors.white,
                    size: 20,
                  )
                ]),
          ),
          Sliders(
            amount: loanTerm.toDouble(),
            calculate: calculateLoanTerm,
            max: 60,
            min: 0,
            labels: [
              FlutterSliderHatchMarkLabel(
                  percent: 1, label: Txt(title: '-', size: 20, colour: grey)),
              FlutterSliderHatchMarkLabel(
                  percent: 20, label: Txt(title: '12', colour: grey)),
              FlutterSliderHatchMarkLabel(
                  percent: 40, label: Txt(title: '24', colour: grey)),
              FlutterSliderHatchMarkLabel(
                  percent: 60, label: Txt(title: '36', colour: grey)),
              FlutterSliderHatchMarkLabel(
                  percent: 80, label: Txt(title: '48', colour: grey)),
              FlutterSliderHatchMarkLabel(
                  percent: 97, label: Txt(title: '60', colour: grey)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Txt(
                      title: 'FICO Credit Score ',
                      colour: Colors.white,
                      size: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    Icon(
                      Icons.info_outline_rounded,
                      color: grey,
                      size: 16,
                    ),
                  ]),
                  Txt(
                    title: score.toString(),
                    colour: Colors.white,
                    size: 20,
                  )
                ]),
          ),
          Sliders(
              amount: score.toDouble(),
              calculate: calculateScore,
              max: 800,
              min: 0,
              labels: [
                FlutterSliderHatchMarkLabel(
                    percent: 1, label: Txt(title: '-', size: 20, colour: grey)),
                FlutterSliderHatchMarkLabel(
                    percent: 20, label: Txt(title: '<579', colour: grey)),
                FlutterSliderHatchMarkLabel(
                    percent: 40, label: Txt(title: '580', colour: grey)),
                FlutterSliderHatchMarkLabel(
                    percent: 60, label: Txt(title: '670', colour: grey)),
                FlutterSliderHatchMarkLabel(
                    percent: 80, label: Txt(title: '740', colour: grey)),
                FlutterSliderHatchMarkLabel(
                    percent: 98, label: Txt(title: '800+', colour: grey)),
              ]),
          SizedBox(height: 12),
        ]),
      ),
    );
  }
}
