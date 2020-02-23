import 'package:flutter/material.dart';

class Outcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The diagnosis'),
      ),
      body: Center(
        child: Text('My friend u just have pneumonia'),
      ),
    );
  }
}
