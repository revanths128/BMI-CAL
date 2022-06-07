import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculatorBrain{
  CalculatorBrain({this.height,this.weight});

  int height;
  int weight;
  double bmi;

  String calculateBmi(){
    bmi=weight/pow(height/100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(bmi>=25){
      return "overweight";
    }
    else if(bmi>18.5){
      return "normal";
    }else{
      return "underweight";
    }
  }
  String getInterpretation(){
    if(bmi>=25){
      return "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    }
    else if(bmi>18.5){
      return "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb";
    }else{
      return "cccccccccccccccccccccccccccccccccccc";
    }
  }
}