import 'package:flutter/material.dart';

class YesNoButton extends StatelessWidget {
  String yesorno;

  Function changeQuestion;

  YesNoButton(this.yesorno, this.changeQuestion);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: RaisedButton(
        child: Text(yesorno),
        onPressed: () {
          changeQuestion();
        },
      ),
    );
  }
}
