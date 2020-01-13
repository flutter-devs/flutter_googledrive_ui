import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressBar extends StatefulWidget {
  @override
  _ProgressBarState createState() => _ProgressBarState();
}
class _ProgressBarState extends State<ProgressBar> {
  double percent = 0.0;
  @override
  void initState() {
    Timer timer;
    timer = Timer.periodic(Duration(milliseconds:20),(_){
      print('Percent Update');

      setState(() {
        percent+=5;
        if(percent >= 100){
          timer.cancel();
          // percent=0;
        }
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height:50,
      width: 25,
      // color: Colors.cyan,
      child:CircularPercentIndicator(
        radius: 30.0,
        lineWidth:4.0,
        animation: true,

        animationDuration:2000,

        percent: percent/100,

        center:Text(percent.toString() +"%",style: TextStyle(fontSize:5.0,fontWeight: FontWeight.w600,color: Colors.white),),

        circularStrokeCap: CircularStrokeCap.round,
        progressColor: Colors.red,
        backgroundColor: Colors.white,
      ),
    );
  }
}
