import 'package:flutter/material.dart';

class MCQ extends StatefulWidget {
  @override
  _MCQState createState() => _MCQState();
}

class _MCQState extends State<MCQ> {
  var answer = 0;
  var scoreCard;
  score(){
    if (answer == 1){

    }
  }

  initState(){
    super.initState();
    AlertDialog(
      title: Text("Start yor quiz "),
      actions: [
        FlatButton(
            color: Colors.red,
            onPressed: (){
              Navigator.pop(context);},
            child:
            Text("ok", style: TextStyle(color: Colors.white))),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}