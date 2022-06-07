import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/resuable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Color maleCardColor = activeCardColor;
Color femaleCardColor = activeCardColor;
Gender selectedGender;
int height = 180;
int weight = 80;
int age = 23;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ResuableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? inactiveCardColor
                          : activeCardColor,
                      carChild: IconContent(FontAwesomeIcons.mars, "MALE"),
                    ),
                  ),
                  Expanded(
                    child: ResuableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? inactiveCardColor
                          : activeCardColor,
                      carChild: IconContent(FontAwesomeIcons.venus, "FEMALE"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ResuableCard(
                colour: activeCardColor,
                carChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: LableTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: NumberTextStyle,
                        ),
                        Text(
                          "cm",
                          style: LableTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 10),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 20)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 240,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ResuableCard(
                      colour: activeCardColor,
                      carChild: Column(
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: LableTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: NumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ResuableCard(
                      colour: activeCardColor,
                      carChild: Column(
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: LableTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: NumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
                ontap: () {
                  CalculatorBrain calc=CalculatorBrain(height: height,weight: weight);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(bmiresult: calc.calculateBmi(), resulttext: calc.getResult(), interpretation: calc.getInterpretation())));
                },
                title: 'CALCULATE'
            ),
          ],
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.onpress, this.icon});
  Function onpress;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
    );
  }
}
