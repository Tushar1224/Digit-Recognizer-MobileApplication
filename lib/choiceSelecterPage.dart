import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/icon_content.dart';
import 'components/reusable_card.dart';
import 'components/constants.dart';

import 'package:camera/camera.dart';


class ChoicePage extends StatefulWidget {
  @override
  _CHoicePageState createState() => _CHoicePageState();
}

class _CHoicePageState extends State<ChoicePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digit Recognizer'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 60.0,
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {
                setState(() {
                  Navigator.pushNamed(context, '/DrawingScreen');
                },);
              },
              colour: KActiveCardColor,
              cardChild: IconContent(
                icon: FontAwesomeIcons.penSquare,
                title: 'DRAW',
                description:'Draw the digit on the screen using your HANDS & our App will recognise it right away.',

              ),
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }
}
