import 'package:flutter/material.dart';
import 'package:lfs_app/custom/player_goal_list.dart';
import '../screens/goal_modal_sheet.dart';
import '../custom/team_stats_title_card.dart';
import './count_down_timer_screen.dart';
import '../models/team.dart';
import './popup_screen.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Match",
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
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    firstTeam.passes++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                ),
                              ),
                              Text(
                                "${firstTeam.passes}",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          TeamStatsTitleCard("Passes"),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                "${secondTeam.passes}",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    secondTeam.passes++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    firstTeam.fouls++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                ),
                              ),
                              Text(
                                "${firstTeam.fouls}",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          TeamStatsTitleCard("Fouls"),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                "${secondTeam.fouls}",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    secondTeam.fouls++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    firstTeam.yellowCards++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                ),
                              ),
                              Text(
                                "${firstTeam.yellowCards}",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          TeamStatsTitleCard("Yellow cards"),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                "${secondTeam.yellowCards}",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    secondTeam.yellowCards++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    firstTeam.redCards++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                ),
                              ),
                              Text(
                                "${firstTeam.redCards}",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          TeamStatsTitleCard("Red cards"),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                "${secondTeam.redCards}",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    secondTeam.redCards++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    firstTeam.offsides++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                ),
                              ),
                              Text(
                                "${firstTeam.offsides}",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          TeamStatsTitleCard("Offsides"),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                "${secondTeam.offsides}",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    secondTeam.offsides++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    firstTeam.corners++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                ),
                              ),
                              Text(
                                "${firstTeam.corners}",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          TeamStatsTitleCard("Corners"),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                "${secondTeam.corners}",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    secondTeam.corners++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
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
    );
  }
}
