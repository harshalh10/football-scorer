import 'package:flutter/material.dart';

import '../models/team.dart';

class SecondTeamStat extends StatefulWidget {
  // const SecondTeamStat({Key? key}) : super(key: key);
  final Team secondTeam;
  final String stat;

  SecondTeamStat(this.secondTeam, this.stat);
  @override
  _SecondTeamStatState createState() => _SecondTeamStatState();
}

class _SecondTeamStatState extends State<SecondTeamStat> {
  String show = "0";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${this.show}",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              // widget.secondTeam.passes++;
              switch (widget.stat) {
                case "passes":
                  widget.secondTeam.passes++;
                  this.show = widget.secondTeam.passes.toString();
                  break;
                case "fouls":
                  widget.secondTeam.fouls++;
                  this.show = widget.secondTeam.fouls.toString();
                  break;
                case "yellowCards":
                  widget.secondTeam.yellowCards++;
                  this.show = widget.secondTeam.yellowCards.toString();
                  break;
                case "redCards":
                  widget.secondTeam.redCards++;
                  this.show = widget.secondTeam.redCards.toString();
                  break;
                case "offsides":
                  widget.secondTeam.offsides++;
                  this.show = widget.secondTeam.offsides.toString();
                  break;
                case "corners":
                  widget.secondTeam.corners++;
                  this.show = widget.secondTeam.corners.toString();
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
      ],
    );
  }
}
