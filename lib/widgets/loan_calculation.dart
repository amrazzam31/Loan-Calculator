import 'package:flutter/material.dart';

import '../widgets/colors.dart';
import '../widgets/txt.dart';

class LoanCalCulation extends StatelessWidget {
  final double payment;
  LoanCalCulation(this.payment);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(children: [
          Txt(
            title: '\$$payment',
            colour: Colors.white,
            size: 28,
            fontWeight: FontWeight.bold,
          ),
          Txt(
            title: 'Est. Monthly Payment',
            size: 14,
            colour: grey,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 12),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Txt(title: 'Est. Interest Rate', size: 14, colour: grey),
            Txt(title: '4.9%', size: 14, colour: grey),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Txt(title: 'Total Est. Cost of Loan', size: 14, colour: grey),
            Txt(title: '\$${1262207}', size: 14, colour: grey),
          ]),
        ]),
      ),
    );
  }
}
