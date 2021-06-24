import 'package:flutter/material.dart';
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
      title: 'Flutter Demo',
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
      title: Text("Local Football Scorer"),
    );
    final mediaQuery = MediaQuery.of(context);
    final appHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        appBar.preferredSize.height;
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GameChoice(
              "Tournament",
            ),
            SizedBox(
              height: appHeight * 0.1,
            ),
            GameChoice(
              "Quick Match",
            ),
          ],
        ),
      ),
    );
  }
}
