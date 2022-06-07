import 'package:flutter/material.dart';

class ResuableCard extends StatelessWidget {

  final Color colour;
  final Widget carChild;
  final Function onPress;
  ResuableCard({@required this.colour,this.carChild,this.onPress});


  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: carChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}
