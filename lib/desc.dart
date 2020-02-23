import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  String dis, desc;
  Description(this.dis, this.desc);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dis),
      ),
      body: Center(
        child: Text(desc),
      ),
    );
  }
}
