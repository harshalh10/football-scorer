import 'package:flutter/material.dart';
import '../screens/match_finish_screen.dart';

void finishPopupDialogCreation(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => _buildPopupDialog(context),
  );
}

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: Text(
      'Finish Match',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Are you sure that you want to finish the match?"),
      ],
    ),
    actions: <Widget>[
      ElevatedButton(
        child: Text('Yes'),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MatchFinishScreen()),
            (Route<dynamic> route) => false,
          );

          // Navigator.of(context).pushReplacement(new MaterialPageRoute(
          //     builder: (BuildContext context) => MatchFinishScreen()));
        },
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // <-- Radius
          ),
        ),
      ),
      ElevatedButton(
        child: Text('No'),
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // <-- Radius
          ),
        ),
      ),
    ],
  );
}
