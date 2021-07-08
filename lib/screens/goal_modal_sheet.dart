import 'package:flutter/material.dart';

import '../models/team.dart';

class GoalModalSheet extends StatefulWidget {
  final Function notifyParent;

  // const GoalModalSheet({Key? key}) : super(key: key);
  final Team firstTeam;
  final Team secondTeam;
  GoalModalSheet(this.firstTeam, this.secondTeam, this.notifyParent);

  @override
  _GoalModalSheetState createState() => _GoalModalSheetState();
}

class _GoalModalSheetState extends State<GoalModalSheet> {
  @override
  Widget build(BuildContext context) {
    List<String> firstTeamPlayerNameList =
        widget.firstTeam.goals.keys.map((e) => e).toList();
    List<String> secondTeamPlayerNameList =
        widget.secondTeam.goals.keys.map((e) => e).toList();
    print(firstTeamPlayerNameList);
    Widget firstTeam() {
      if (firstTeamPlayerNameList.isNotEmpty) {
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: firstTeamPlayerNameList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      firstTeamPlayerNameList[index],
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "No Goals yet! 😢",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      );
    }

    Widget secondTeam() {
      if (secondTeamPlayerNameList.isNotEmpty) {
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: secondTeamPlayerNameList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      secondTeamPlayerNameList[index],
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "No Goals yet! 😢",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                firstTeam(),
                Spacer(),
                secondTeam(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), // <-- Radius
                ),
              ),
              child: Text('Close'),
              onPressed: () {
                Navigator.pop(context);
                widget.notifyParent();
              },
            ),
          ),
        ],
      ),
    );
  }
}
