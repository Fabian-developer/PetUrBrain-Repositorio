import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../utility/Pointer.dart';

// In seconds
const int TIMER_DURATION = 2;

const String RAIN_URL = 'https://www.soundjay.com/nature/rain-01.mp3';

class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    player.setUrl(RAIN_URL);
  }

  @override
  void dispose() {
    if (player.playing) player.stop();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translator.translate('timer01')),
      ),
      body: Center(
        child: CircularCountDownTimer(
          autoStart: true,
          duration: TIMER_DURATION,
          fillColor: Colors.purple[400],
          height: MediaQuery.of(context).size.width * .75,
          isReverse: true,
          isReverseAnimation: false,
          isTimerTextShown: true,
          ringColor: Colors.purple[200],
          strokeCap: StrokeCap.round,
          strokeWidth: MediaQuery.of(context).size.width * .1,
          textStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
          width: MediaQuery.of(context).size.width * .75,
          onComplete: () {
            Navigator.pop(context);
            blocHome.addPoints();
          },
        ),
      ),
      bottomSheet: Container(
        height: 50,
        child: FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(translator.translate('timer02')),
            ],
          ),
          onPressed: () {
            player.playing ? player.pause() : player.play();
          },
        ),
      ),
    );
  }
}
