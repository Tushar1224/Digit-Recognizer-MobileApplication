import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  //IconContent-class for content of reusable card(contains icon and text customly displayed using customly made widget.
  final String title;
  final String description;
  final IconData icon;
  IconContent({this.title,this.description,this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 200.0,
            ),
            SizedBox(
              height:30,
            ),
            Text(
              title,
              style: KLabelTitleStyle,
            ),
            SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: 300,
              child: Text(
                description,
                style: KLabelDescriptionStyle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 25.0,
            ),

          ],
        ),
      ],
    );
  }
}
