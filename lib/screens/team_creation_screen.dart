import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../custom/team_input_card.dart';
import '../models/team.dart';

class TeamCreationScreen extends StatefulWidget {
  const TeamCreationScreen({Key? key}) : super(key: key);
  @override
  _TeamCreationScreenState createState() => _TeamCreationScreenState();
}

class _TeamCreationScreenState extends State<TeamCreationScreen> {
  TeamInputCard firstTeam = new TeamInputCard(
    "First Team",
  );
  TeamInputCard secondTeam = new TeamInputCard(
    "Second Team",
  );
  final timeController = new TextEditingController(
    text: null,
  );

  bool teamCreationValidator() {
    if (timeController.text.isEmpty) {
      return false;
    }
    final int time = int.parse(timeController.text);
    if (firstTeam.inputTeamValidator() &&
        secondTeam.inputTeamValidator() &&
        time > 0 &&
        time < 100 &&
        time % 2 == 0) {
      print("going next screen");
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context);
    final routeArgs = ModalRoute.of(context)!.settings.arguments as String;
    final appBar = AppBar(
      title: Text(routeArgs),
    );
    // final appHeight = mediaQuery.size.height -
    //     mediaQuery.padding.top -
    //     appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: appHeight * 0.04,
                // ),
                firstTeam,
                // SizedBox(
                //   height: appHeight * 0.05,
                // ),
                secondTeam,
                // SizedBox(
                //   height: appHeight * 0.05,
                // ),
                Card(
                  color: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Card(
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Time:"),
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
                              controller: timeController,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.white,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                hintText: "in even minutes",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(7),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("start button taped");
                    if (this.teamCreationValidator()) {
                      final team1 = Team(
                        firstTeam.teamNameController.text,
                        int.parse(firstTeam.teamPlayersController.text),
                        int.parse(firstTeam.teamSubsController.text),
                      );
                      final team2 = Team(
                        secondTeam.teamNameController.text,
                        int.parse(secondTeam.teamPlayersController.text),
                        int.parse(secondTeam.teamSubsController.text),
                      );
                      var arguments = {
                        'firstTeam': team1,
                        'secondTeam': team2,
                        'time': int.parse(timeController.text)
                      };
                      Navigator.pushNamed(
                        context,
                        '/match',
                        arguments: arguments,
                      );
                      print("in match screen");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // <-- Radius
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      'Start Match',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
