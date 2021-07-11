import 'package:flutter/material.dart';

void popupDialogCreation(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => _buildPopupDialog(context),
  );
}

Future<bool> onBackPressedCall(BuildContext context) {
  return _onBackPressed(context);
}

Future<bool> _onBackPressed(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        'Quit Match',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Are you sure that you want to abbruptly quit the match?"),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          child: Text('Yes'),
          onPressed: () {
            Navigator.pop(context, true);
            Navigator.pop(context, true);
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
            Navigator.pop(context, false);
          },
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0), // <-- Radius
            ),
          ),
        ),
      ],
    ),
  ).then((value) => value);
}

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: Text(
      'Quit Match',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Are you sure that you want to abbruptly quit the match?"),
      ],
    ),
    actions: <Widget>[
      ElevatedButton(
        child: Text('Yes'),
        onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
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
