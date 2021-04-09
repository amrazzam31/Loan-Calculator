import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './widgets/colors.dart';
import './screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
