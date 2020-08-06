import 'package:fl_chart/fl_chart.dart';
import 'components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'components/constants.dart';
import 'components/bottom_button.dart';
class ResultsPage extends StatelessWidget {
  ResultsPage({this.chartitems,this.guessed_label});
  final chartitems;
  final guessed_label;
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
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: KTitleStyle,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ReusableCard(
                colour: KActiveCardColor,
                cardChild: Column(
                  children: <Widget>[
                    Expanded(
                      flex:6,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 32, 0, 16),
                        child: BarChart(
                          BarChartData(
                            titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: SideTitles(
                                  showTitles: true,
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                  margin: 6,
                                  getTitles: (double value) {
                                    return value.toInt().toString();
                                  }),
                              leftTitles: SideTitles(
                                showTitles: false,
                              ),
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            barGroups: chartitems,
                            // read about it in the below section
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        kGuessingInputString + ' '+guessed_label,
                        style: KLabelDescriptionStyle,
                        textAlign: TextAlign.center,
                      ),
                      flex: 1,
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
              text: 'Go Back',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
