import 'package:flutter/material.dart';

import './widgets/colors.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loan Calculator',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: black,
      ),
      home: HomeScreen(),
    );
  }
}
