import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TeamInputCard extends StatefulWidget {
  // const TeamInputCard({Key? key}) : super(key: key);
  final String teamCardName;
  TeamInputCard(this.teamCardName);
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
    if (teamNameController.text.isEmpty ||
        teamPlayersController.text.isEmpty ||
        teamSubsController.text.isEmpty ||
        teamNameController.text.length > 20) {
      print("null");
      return false;
    }
    final int teamPlayers = int.parse(this.teamPlayersController.text);
    final int teamSubs = int.parse(this.teamSubsController.text);
    if (teamPlayers < 3 || teamPlayers > 11 || teamSubs > 7) {
      print("players subs");
      return false;
    }

    return true;
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
                widget.teamCardName,
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
                    child: Text(
                      "Name:",
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Card(
                    color: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 4,
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
                        isDense: true,
                        contentPadding: EdgeInsets.all(7),
                        hintText: "max 20 characters",
                      ),
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
                  child: Card(
                    color: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 4,
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
                        contentPadding: EdgeInsets.all(7),
                        hintText: "3 to 11",
                      ),
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
                  child: Card(
                    color: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 4,
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
                        contentPadding: EdgeInsets.all(7),
                        hintText: "0 to 7",
                      ),
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
