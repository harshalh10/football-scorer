import 'package:flutter/material.dart';

class CurrentMatch extends StatefulWidget {
  const CurrentMatch({Key? key}) : super(key: key);

  @override
  _CurrentMatchState createState() => _CurrentMatchState();
}

class _CurrentMatchState extends State<CurrentMatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Match",
        ),
      ),
      body: Center(
        child: Text(
          "harshal",
        ),
      ),
    );
  }
}
