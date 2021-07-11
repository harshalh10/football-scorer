import 'package:flutter/material.dart';
import '../custom/first_team_stat.dart';
import '../custom/second_team_stat.dart';
import '../screens/goal_modal_sheet.dart';
import '../custom/team_stats_title_card.dart';
import './count_down_timer_screen.dart';
import '../models/team.dart';
import './popup_screen.dart';
import './abbrupt_quit_match_popup.dart' as abbruptlyQuitMatch;
import './match_finish_screen.dart';

class CurrentMatch extends StatefulWidget {
  const CurrentMatch({Key? key}) : super(key: key);

  @override
  _CurrentMatchState createState() => _CurrentMatchState();
}

class _CurrentMatchState extends State<CurrentMatch> {
  void addGoal(Team team) {}

  int firstTeamGoals = 0;
  int secondTeamGoals = 0;

  @override
  Widget build(BuildContext context) {
    refresh() {
      setState(() {});
    }

    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map;
    final Team firstTeam = routeArgs['firstTeam'];
    final Team secondTeam = routeArgs['secondTeam'];
    CountDownTimerPage.time = routeArgs['time'];
    MatchFinishScreen.teams['firstTeam'] = firstTeam;
    MatchFinishScreen.teams['secondTeam'] = secondTeam;
    void startViewGoal(BuildContext ctx) {
      showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: GoalModalSheet(firstTeam, secondTeam, refresh),
            behavior: HitTestBehavior.opaque,
          );
        },
      );
    }

    return WillPopScope(
      onWillPop: () async {
        return abbruptlyQuitMatch.onBackPressedCall(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Match",
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              abbruptlyQuitMatch.popupDialogCreation(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CountDownTimerPage(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  color: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TeamStatsTitleCard(firstTeam.name),
                            TeamStatsTitleCard("Team Stats"),
                            TeamStatsTitleCard(secondTeam.name),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                GoalPopUpScreen(firstTeam, refresh),
                                Text(
                                  "${firstTeam.teamGoals}",
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            TeamStatsTitleCard("Goals"),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  "${secondTeam.teamGoals}",
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                                GoalPopUpScreen(secondTeam, refresh),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            // Row(
                            //   children: [
                            //     ElevatedButton(
                            //       onPressed: () {
                            //         setState(() {
                            //           firstTeam.passes++;
                            //         });
                            //       },
                            //       child: Icon(
                            //         Icons.add,
                            //       ),
                            //       style: ElevatedButton.styleFrom(
                            //         shape: CircleBorder(),
                            //       ),
                            //     ),
                            //     Text(
                            //       "${firstTeam.passes}",
                            //       style: TextStyle(
                            //         fontSize: 30,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            FirstTeamStat(firstTeam, "passes"),
                            Spacer(),
                            TeamStatsTitleCard("Passes"),
                            Spacer(),
                            SecondTeamStat(secondTeam, "passes"),
                            // Row(
                            //   children: [
                            //     Text(
                            //       "${secondTeam.passes}",
                            //       style: TextStyle(
                            //         fontSize: 30,
                            //       ),
                            //     ),
                            //     ElevatedButton(
                            //       onPressed: () {
                            //         setState(() {
                            //           secondTeam.passes++;
                            //         });
                            //       },
                            //       child: Icon(
                            //         Icons.add,
                            //       ),
                            //       style: ElevatedButton.styleFrom(
                            //         shape: CircleBorder(),
                            //       ),
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                        Row(
                          children: [
                            FirstTeamStat(firstTeam, "fouls"),
                            Spacer(),
                            TeamStatsTitleCard("Fouls"),
                            Spacer(),
                            SecondTeamStat(secondTeam, "fouls"),
                          ],
                        ),
                        Row(
                          children: [
                            FirstTeamStat(firstTeam, "yellowCards"),
                            Spacer(),
                            TeamStatsTitleCard("Yellow cards"),
                            Spacer(),
                            SecondTeamStat(secondTeam, "yellowCards"),
                          ],
                        ),
                        Row(
                          children: [
                            FirstTeamStat(firstTeam, "redCards"),
                            Spacer(),
                            TeamStatsTitleCard("Red cards"),
                            Spacer(),
                            SecondTeamStat(secondTeam, "redCards"),
                          ],
                        ),
                        Row(
                          children: [
                            FirstTeamStat(firstTeam, "offsides"),
                            Spacer(),
                            TeamStatsTitleCard("Offsides"),
                            Spacer(),
                            SecondTeamStat(secondTeam, "offsides"),
                          ],
                        ),
                        Row(
                          children: [
                            FirstTeamStat(firstTeam, "corners"),
                            Spacer(),
                            TeamStatsTitleCard("Corners"),
                            Spacer(),
                            SecondTeamStat(secondTeam, "corners"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0), // <-- Radius
                  ),
                ),
                child: Text("View Goals"),
                onPressed: () {
                  startViewGoal(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
