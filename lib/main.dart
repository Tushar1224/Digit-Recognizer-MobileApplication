import 'dart:async';
import 'package:flutter/material.dart';
import 'choiceSelecterPage.dart';
import 'drawingPage.dart';


void main() {
  Timer timer;

  void autoPress(){
    runApp(WelcomeScreen());
    timer = new Timer(const Duration(seconds:2),(){
      runApp(DigitRecognizer());
    });
//    runApp(DigitRecognizer());
  }

  autoPress();

}
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTextStyle(
          style: TextStyle(decoration: TextDecoration.none,fontSize: 60,fontWeight:FontWeight.bold,color: Colors.red),
          child :Center(
            child: Text('Welcome'),
          ),
        )
    );
  }
}

class DigitRecognizer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digit Recognizer',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=>ChoicePage(),
        '/DrawingScreen':(context)=>DrawingPage(),
      },
    );
  }
}

