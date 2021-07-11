import 'package:flutter/material.dart';

class Tournament extends StatelessWidget {
  const Tournament({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tournament"),
      ),
      body: Center(
        child: Text(
          "Coming soon",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
