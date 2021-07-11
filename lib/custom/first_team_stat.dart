import 'package:flutter/material.dart';

import '../models/team.dart';

class FirstTeamStat extends StatefulWidget {
  // const FirstTeamStat({Key? key}) : super(key: key);
  final Team firstTeam;
  final String stat;

  FirstTeamStat(this.firstTeam, this.stat);
  @override
  _FirstTeamStatState createState() => _FirstTeamStatState();
}

class _FirstTeamStatState extends State<FirstTeamStat> {
  String show = "0";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              // widget.firstTeam.passes++;
              switch (widget.stat) {
                case "passes":
                  widget.firstTeam.passes++;
                  this.show = widget.firstTeam.passes.toString();
                  break;
                case "fouls":
                  widget.firstTeam.fouls++;
                  this.show = widget.firstTeam.fouls.toString();
                  break;
                case "yellowCards":
                  widget.firstTeam.yellowCards++;
                  this.show = widget.firstTeam.yellowCards.toString();
                  break;
                case "redCards":
                  widget.firstTeam.redCards++;
                  this.show = widget.firstTeam.redCards.toString();
                  break;
                case "offsides":
                  widget.firstTeam.offsides++;
                  this.show = widget.firstTeam.offsides.toString();
                  break;
                case "corners":
                  widget.firstTeam.corners++;
                  this.show = widget.firstTeam.corners.toString();
                  break;
                default:
                  break;
              }
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
          "${this.show}",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
