import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../custom/team_input_card.dart';

class TeamCreationScreen extends StatefulWidget {
  const TeamCreationScreen({Key? key}) : super(key: key);
  @override
  _TeamCreationScreenState createState() => _TeamCreationScreenState();
}

class _TeamCreationScreenState extends State<TeamCreationScreen> {
  TeamInputCard firstTeam = TeamInputCard(
    "First Team",
  );
  TeamInputCard secondTeam = TeamInputCard(
    "Second Team",
  );
  final timeController = TextEditingController(
    text: null,
  );

  bool teamCreationValidator() {
    if (timeController.text == null) {
      return false;
    }
    final int time = int.parse(timeController.text);
    if (firstTeam.inputTeamValidator() &&
        secondTeam.inputTeamValidator() &&
        time > 0 &&
        time < 100) {
      print("going next screen");
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final routeArgs = ModalRoute.of(context)!.settings.arguments as String;
    final appBar = AppBar(
      title: Text(routeArgs),
    );
    final appHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        appBar.preferredSize.height;

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
                              hintText: "in minutes",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
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
                      Navigator.pushNamed(context, '/match', arguments: null);
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
