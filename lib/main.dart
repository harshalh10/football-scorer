import 'package:flutter/material.dart';
import './screens/side_drawer.dart';
import '../screens/match_finish_screen.dart';
import './screens/match.dart';
import './screens/team_creation_screen.dart';
import 'custom/game_choice.dart';
import './config/palette.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Scorer',
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        primarySwatch: Palette.appColor,
        accentColor: Palette.appColorAccent,
      ),
      home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/team-creation': (context) => TeamCreationScreen(),
        '/match': (context) => CurrentMatch(),
        '/match-finish': (context) => MatchFinishScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text("Football Scorer"),
    );

    return Scaffold(
      appBar: appBar,
      drawer: SideDrawer(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(),
            GameChoice(
              "Tournament",
            ),
            Spacer(),
            GameChoice(
              "Quick Match",
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
