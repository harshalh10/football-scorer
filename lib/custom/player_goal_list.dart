import 'package:flutter/material.dart';

import '../models/team.dart';

class PlayerGoalList extends StatefulWidget {
  // const PlayerGoalList({Key? key}) : super(key: key);
  final Team firstTeam;
  final Team secondTeam;
  PlayerGoalList(this.firstTeam, this.secondTeam);

  @override
  _PlayerGoalListState createState() => _PlayerGoalListState();
}

class _PlayerGoalListState extends State<PlayerGoalList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (ctx, index) {
      return Row(children: []);
    });
  }
}
