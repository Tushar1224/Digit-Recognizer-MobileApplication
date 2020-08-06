import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String text;

  BottomButton({@required this.onTap, @required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: KLargeButtonText,
          ),
        ),
        color: KBottomContainerColor,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        height: KBottomContainerHeight,
      ),
    );
  }
}
