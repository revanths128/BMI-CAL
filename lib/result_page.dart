import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/resuable_card.dart';
import 'constants.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiresult,@required this.resulttext,@required this.interpretation});

  String bmiresult;
  String resulttext;
  String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  'YOUR RESULT',
                  style: titleTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ResuableCard(
              colour: activeCardColor,
              carChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resulttext,
                    style: resultTextStyle,
                  ),
                  Text(
                    bmiresult,
                    style: bmiTextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: bodyTextStyle,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            ontap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> InputPage()));
            },
            title: 'RE CAL'
          ),
        ],
      ),
    );
  }
}
