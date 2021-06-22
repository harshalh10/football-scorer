import 'package:flutter/material.dart';
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
    final appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Theme.of(context).accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 4,
              child: InkWell(
                splashColor: Colors.lightBlue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: SizedBox(
                  width: appWidth * 0.7,
                  height: appHeight * 0.2,
                  child: Center(
                    child: Text(
                      'Tournament',
                      style: TextStyle(
                        fontSize: 25,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: appHeight * 0.1,
            ),
            Card(
              color: Theme.of(context).accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 4,
              child: InkWell(
                splashColor: Colors.lightBlue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: SizedBox(
                  width: appWidth * 0.7,
                  height: appHeight * 0.2,
                  child: Center(
                    child: Text(
                      'Quick Match',
                      style: TextStyle(
                        fontSize: 25,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
