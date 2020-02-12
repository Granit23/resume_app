import 'package:flutter/material.dart';
import 'dart:math';
import '../models/eight_ball.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  
  final eightBall = EightBall();

  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Call Me...Maybe?", style: Theme.of(context).textTheme.headline4),
          Padding(
            padding: EdgeInsets.all(20),
            child: GestureDetector( 
              onTap: () { setState(() {eightBall.randomizeAnswer();}); },
              child:Text("Definitely not a rick roll, please tap me", style: Theme.of(context).textTheme.headline6) 
            )
          ),
          Text(eightBall.getAnswer(), style: Theme.of(context).textTheme.headline4, textAlign: TextAlign.center,),
        ],
    );
  }
}