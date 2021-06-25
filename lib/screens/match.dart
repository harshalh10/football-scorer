import 'package:flutter/material.dart';
import '../custom/team_stats_title_card.dart';
import './count_down_timer_screen.dart';
import '../models/team.dart';

class CurrentMatch extends StatefulWidget {
  const CurrentMatch({Key? key}) : super(key: key);

  @override
  _CurrentMatchState createState() => _CurrentMatchState();
}

class _CurrentMatchState extends State<CurrentMatch> {
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map;
    final Team firstTeam = routeArgs['firstTeam'];
    final Team secondTeam = routeArgs['secondTeam'];
    CountDownTimerPage.time = routeArgs['time'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Match",
        ),
      ),
      body: Column(
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.add,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                              ),
                            ),
                            Text(
                              "${1}",
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
                              "${1}",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
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
          )
        ],
      ),
    );
  }
}
