
import 'package:flutter/material.dart';
import 'components/constants.dart';
import 'components/bottom_button.dart';
import 'resultsPage.dart';
import 'components/drawing_painter.dart';
import 'brain.dart';
import 'package:fl_chart/fl_chart.dart';

class DrawingPage extends StatefulWidget {
  @override
  _DrawingPaintState createState() => _DrawingPaintState();
}

class _DrawingPaintState extends State<DrawingPage> {

  List<Offset> points = List();//Points is simply a property declaration in our class and it is going to host a list of points.
  AppBrain brain = AppBrain();

  @override
  void initState() {
    super.initState();
    brain.loadModel();
    _buildBarChartInfo();
    guess='';
  }
  void _cleanDrawing() {
    setState(() {
      points = List();
      guess='';
    });
  }
//  ----------------------chart functions------------
  List<BarChartGroupData> chartItems = List();
  var guess ='';

  BarChartGroupData _makeGroupData(int x, double y) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
        y: y,
        color: kBarColor,
        width: kChartBarWidth,
        isRound: true,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          y: 1,
          color: kBarBackgroundColor,
        ),
      ),
    ]);
  }

  void _buildBarChartInfo({List recognitions= const []}) {
    // Reset the list
    chartItems = List();

    // Create as many barGroups as outputs our prediction has
    for( var i = 0 ; i<kModelNumberOutputs ; i++ ) {
      var barGroup = _makeGroupData(i, 0);
      chartItems.add(barGroup);
    }

    // For each one of our predictions, attach the probability
    // to the right index

    for (var recognition in recognitions) {
      final idx = recognition["index"];
      if (0 <= idx && idx <= 9) {
        final confidence = recognition["confidence"];
        chartItems[idx] = _makeGroupData(idx, confidence);
      }
    }
  }
//  ------------------------------------------------------



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Digit Recogniser'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Center(
                  child: Text(
                    'DRAW & RECOGNISE',
                    style: KTitleStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              flex:2,
              child: Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 16),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  border: new Border.all(
                    width: 3.0,
                    color: Colors.blue,
                  ),
                ),
                child: Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onPanUpdate: (details) {
                        setState(() {
                          RenderBox renderBox = context.findRenderObject();
                          points.add(
                              renderBox.globalToLocal(details.globalPosition));
                        });
                      },
                      onPanStart: (details) {
                        setState(() {
                          RenderBox renderBox = context.findRenderObject();
                          points.add(
                              renderBox.globalToLocal(details.globalPosition));
                        });
                      },
                      onPanEnd: (details) async {
                        points.add(null);
                        List predictions = await brain.processCanvasPoints(points);
                        print(predictions);
                        guess=predictions.first['label'];
                        setState(() {
                          _buildBarChartInfo(recognitions: predictions);
                        });
                      },
                      child: ClipRect(
                        child: CustomPaint(
                          size: Size(kCanvasSize, kCanvasSize),
                          painter: DrawingPainter(
                            offsetPoints: points,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
                flex:1,
                child: BottomButton(
                  text: 'RECOGNIZE',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ResultsPage(
                            guessed_label: guess,
                            chartitems : chartItems,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: BottomButton(
                  text: 'Clear',
                  onTap: () {
                    _cleanDrawing();
                    _buildBarChartInfo();
                  },
                ),
              ),
            SizedBox(
              height: 10,
            )
          ],
        ),
    );
  }


}
