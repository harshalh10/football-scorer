import 'package:flutter/material.dart';

class GameChoice extends StatelessWidget {
  // const GameChoice({Key? key}) : super(key: key);
  GameChoice(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar();
    final mediaQuery = MediaQuery.of(context);
    final appHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        appBar.preferredSize.height;
    final appWidth = MediaQuery.of(context).size.width;

    return Card(
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      child: InkWell(
        splashColor: Colors.lightBlue.withAlpha(30),
        onTap: () {
          print('Card tapped.');
        },
        child: SizedBox(
          width: appWidth * 0.7,
          height: appHeight * 0.2,
          child: Center(
            child: Text(
              this.text,
              style: TextStyle(
                fontSize: 25,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
