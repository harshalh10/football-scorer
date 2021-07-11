import 'package:flutter/material.dart';
import '../main.dart';
import '../models/team.dart';

class MatchFinishScreen extends StatelessWidget {
  MatchFinishScreen({Key? key}) : super(key: key);
  static var teams = {};
  final Team firstTeam = MatchFinishScreen.teams['firstTeam'];
  final Team secondTeam = MatchFinishScreen.teams['secondTeam'];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      title: Text("Result"),
    );
    final appHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        appBar.preferredSize.height;
    final appWidth = mediaQuery.size.width;
    List<String> firstTeamPlayerNameList =
        this.firstTeam.goals.keys.map((e) => e).toList();
    List<String> secondTeamPlayerNameList =
        this.secondTeam.goals.keys.map((e) => e).toList();

    Widget firstTeam() {
      if (firstTeamPlayerNameList.isNotEmpty) {
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: firstTeamPlayerNameList.length,
            itemBuilder: (BuildContext context, int index) {
              int playerGoal = this
                  .firstTeam
                  .goals[firstTeamPlayerNameList[index]]!
                  .goalByPlayer;
              return Row(
                children: [
                  Expanded(
                    child: Text(
                      firstTeamPlayerNameList[index],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    " - $playerGoal",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              );
            },
          ),
        );
      }
      return Text(
        "No Goals",
        style: TextStyle(
          color: Colors.white,
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
              int playerGoal = this
                  .secondTeam
                  .goals[secondTeamPlayerNameList[index]]!
                  .goalByPlayer;
              return Row(
                children: [
                  Expanded(
                    child: Text(
                      secondTeamPlayerNameList[index],
                      style: TextStyle(color: Colors.white),
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    " - $playerGoal",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              );
            },
          ),
        );
      }
      return Text(
        "No Goals",
        style: TextStyle(
          color: Colors.white,
        ),
      );
    }

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: appHeight * 0.4,
              child: Card(
                color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: appWidth * 0.2,
                                  child: RichText(
                                    overflow: TextOverflow
                                        .ellipsis, // this will help add dots after maxLines
                                    maxLines:
                                        2, // max lines after that dots comes
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25),
                                        text: this.firstTeam.name),
                                  ),
                                ),
                                SizedBox(width: appWidth * 0.05),
                                Text(
                                  this.firstTeam.teamGoals.toString(),
                                  style: TextStyle(fontSize: 45),
                                )
                              ],
                            ),
                          ),
                          Text(
                            '-',
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  this.secondTeam.teamGoals.toString(),
                                  style: TextStyle(fontSize: 45),
                                ),
                                SizedBox(width: appWidth * 0.05),
                                SizedBox(
                                  width: appWidth * 0.2,
                                  child: RichText(
                                    overflow: TextOverflow
                                        .ellipsis, // this will help add dots after maxLines
                                    maxLines:
                                        2, // max lines after that dots comes
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25),
                                        text: this.secondTeam.name),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            firstTeam(),
                            Spacer(),
                            secondTeam(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text('Home Screen'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                  (Route<dynamic> route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), // <-- Radius
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
