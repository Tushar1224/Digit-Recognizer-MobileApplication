import 'dart:ui';

import 'package:flutter/material.dart';


const double kCanvasSize = 200.0;
const double kStrokeWidth = 12.0;
const Color kBlackBrushColor = Colors.black;
const bool kIsAntiAlias = true;

const int kModelInputSize = 28;
const double kCanvasInnerOffset = 40.0;

const Color kBrushBlack = Colors.black;
const Color kBrushWhite = Colors.white;

final Paint kDrawingPaint = Paint()
  ..strokeCap = StrokeCap.square
  ..isAntiAlias = kIsAntiAlias
  ..color = kBrushBlack
  ..strokeWidth = kStrokeWidth;

final Paint kWhitePaint = Paint()
  ..strokeCap = StrokeCap.square
  ..isAntiAlias = kIsAntiAlias
  ..color = kBrushWhite
  ..strokeWidth = kStrokeWidth;

final kBackgroundPaint = Paint()..color = kBrushBlack;

//--------------------------------
final kModelNumberOutputs=10;
const Color kBarColor = Colors.blue;
const Color kBarBackgroundColor = Colors.transparent;
const double kChartBarWidth = 22;

const String kGuessingInputString = 'The number you draw is';



//------------------------------------------

const KActiveCardColor = Color(0xFF1D1E33);
const KBottomContainerColor = Color(0xFFEB1555);
const KBottomContainerHeight = 100.0;

const KLabelTitleStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFFD5DBDB),
);
const KLabelDescriptionStyle = TextStyle(
  fontSize: 20.0,
  color: Color(0xFF8D8E98),
  fontStyle:FontStyle.italic,

);
const KTitleStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.w900,
);
const KLargeButtonText = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.w900,
);

//--------------------------------------

