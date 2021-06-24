import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TeamInputCard extends StatefulWidget {
  // const TeamInputCard({Key? key}) : super(key: key);
  final String team;
  TeamInputCard(this.team);
  bool flag = false;
  final teamNameController = TextEditingController(
    text: null,
  );
  final teamPlayersController = TextEditingController(
    text: null,
  );
  final teamSubsController = TextEditingController(
    text: null,
  );
  bool inputTeamValidator() {
    this.flag = false;
    if (teamNameController.text == null ||
        teamPlayersController.text == null ||
        teamSubsController.text == null) {
      print("null");
      return this.flag;
    }
    final int teamPlayers = int.parse(teamPlayersController.text);
    final int teamSubs = int.parse(teamSubsController.text);
    if (teamPlayers < 3 || teamPlayers > 11 || teamSubs > 7) {
      print("players subs");
      return this.flag;
    }
    this.flag = true;
    return this.flag;
  }

  @override
  _TeamInputCardState createState() => _TeamInputCardState();
}

class _TeamInputCardState extends State<TeamInputCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.team,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Row(
              children: [
                Card(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Name:"),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: widget.teamNameController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.white,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      isDense: true, // Added this
                      contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Card(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Players:"),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: widget.teamPlayersController,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.white,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.all(8),
                      hintText: "3 to 11",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Card(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Subs:"),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: widget.teamSubsController,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.white,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.all(8),
                      hintText: "0 to 7",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
