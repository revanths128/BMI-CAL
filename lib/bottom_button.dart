import 'package:flutter/material.dart';
import 'package:bmi_calculator/resuable_card.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
BottomButton({@required this.ontap,@required this.title});

Function ontap;
String title;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ontap,
      child: Container(
        color: bottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: bottomHeight,
        child: Center(
          child: Text(
            title,
            style: titleTextStyle,
          ),
        ),
      ),


    );
  }
}
