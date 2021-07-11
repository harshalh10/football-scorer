import 'package:flutter/material.dart';
import 'package:lfs_app/screens/coming_soon.dart';

class GameChoice extends StatelessWidget {
  // const GameChoice({Key? key}) : super(key: key);
  final String matchType;
  GameChoice(this.matchType);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar();
    final mediaQuery = MediaQuery.of(context);
    final appHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        appBar.preferredSize.height;
    final appWidth = MediaQuery.of(context).size.width;

    return Card(
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      child: InkWell(
        splashColor: Colors.lightBlue.withAlpha(30),
        onTap: () {
          if (this.matchType == 'Quick Match') {
            Navigator.pushNamed(
              context,
              '/team-creation',
              arguments: this.matchType,
            );
            print('Quick Match Card tapped.');
          }
          if (this.matchType == "Tournament") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Tournament()));
          }
        },
        child: SizedBox(
          width: appWidth * 0.7,
          height: appHeight * 0.2,
          child: Center(
            child: Text(
              this.matchType,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
