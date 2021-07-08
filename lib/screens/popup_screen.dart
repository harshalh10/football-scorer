import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../models/team.dart';

class GoalPopUpScreen extends StatefulWidget {
  // const GoalPopUpScreen({Key? key}) : super(key: key);
  final Function notifyParent;

  GoalPopUpScreen(this.team, this.notifyParent);
  final Team team;
  final playerNameController = TextEditingController(
    text: null,
  );
  @override
  _GoalPopUpScreenState createState() => _GoalPopUpScreenState();
}

class _GoalPopUpScreenState extends State<GoalPopUpScreen> {
  void addGoal(String playerName) {
    bool containsKey = widget.team.goals.containsKey(playerName);
    if (containsKey) {
      widget.team.goals.update(playerName, (value) {
        value.goalByPlayer = value.goalByPlayer + 1;
        return value;
      });
    } else {
      widget.team.goals[playerName] = new GoalByPlayer(1);
    }
    widget.team.teamGoals = 0;
    widget.team.goals.values.forEach((element) {
      widget.team.teamGoals = widget.team.teamGoals + element.goalByPlayer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => _buildPopupDialog(context),
        );
      },
      child: Icon(
        Icons.add,
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    List<String> playerNameSuggestionList =
        widget.team.goals.keys.map((e) => e).toList();
    List<String> getSuggestions(String query) {
      List<String> matches = <String>[];
      matches.addAll(playerNameSuggestionList);

      matches.retainWhere((s) => s.contains(query));
      return matches;
    }

    return AlertDialog(
      title: Text(widget.team.name),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                decoration: InputDecoration(labelText: 'Name'),
                controller: widget.playerNameController,
              ),
              suggestionsCallback: (pattern) {
                return getSuggestions(pattern);
              },
              itemBuilder: (context, String suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              onSuggestionSelected: (String suggestion) {
                widget.playerNameController.text = suggestion;
              },
              noItemsFoundBuilder: (BuildContext context) {
                return Text('No Name Found!');
              }),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          child: Text('Add Goal'),
          onPressed: () {
            if (widget.playerNameController.text.isNotEmpty) {
              this.addGoal(widget.playerNameController.text);
              Navigator.pop(context);
              widget.notifyParent();
            }
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
}
