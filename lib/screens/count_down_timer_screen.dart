import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import './finish_popup_dialog.dart' as finishPopup;

class CountDownTimerPage extends StatefulWidget {
  static int time = 3;
  CountDownTimerPage();

  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (_) => CountDownTimerPage(),
      ),
    );
  }

  @override
  _CountDownTimerPageState createState() => _CountDownTimerPageState();
}

class _CountDownTimerPageState extends State<CountDownTimerPage> {
  final _isHours = true;
  bool clicked2ndHalfButton = true;
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromMinute(
        (CountDownTimerPage.time * 0.5).toInt()),
    onChange: (value) => print('onChange $value'),
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
    onEnded: () {
      print('onEnded');
    },
  );

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.rawTime.listen((value) {
      print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}');
    });
    _stopWatchTimer.minuteTime.listen((value) => print('minuteTime $value'));
    _stopWatchTimer.secondTime.listen((value) => print('secondTime $value'));
    _stopWatchTimer.records.listen((value) => print('records $value'));

    /// Can be set preset time. This case is "00:01.23".
    // _stopWatchTimer.setPresetTime(mSec: 1234);
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bool clicked2ndHalf = false;
    // bool clicked2ndHalfButton = true;
    // bool startClicked = false;
    print(this.clicked2ndHalfButton);
    print("hii");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          /// Display stop watch time
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context, snap) {
                final value = snap.data!;
                print("value = $value");
                // if (value == 0) {
                //   clicked2ndHalf = true;
                // }
                // print(clicked2ndHalf);
                final displayTime =
                    StopWatchTimer.getDisplayTime(value, hours: _isHours);
                final displayTimeOptimized =
                    displayTime.substring(3, displayTime.length - 3);
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        displayTimeOptimized,
                        style: const TextStyle(
                          fontSize: 40,
                          // fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          /// Button
          Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            onPrimary: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.start);
                            // startClicked = true;
                          },
                          child: const Text(
                            'Start',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            onPrimary: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.stop);
                          },
                          child: const Text(
                            'Stop',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            if (this.clicked2ndHalfButton) {
                              _stopWatchTimer.onExecute
                                  .add(StopWatchExecute.reset);
                              // clicked2ndHalf = false;
                              this.clicked2ndHalfButton = false;
                              print("success,${this.clicked2ndHalfButton}");
                            }
                          },
                          child: const Text(
                            '2nd Half',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.indigo,
                            onPrimary: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                            finishPopup.finishPopupDialogCreation(context);
                          },
                          child: const Text(
                            'Finish',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
