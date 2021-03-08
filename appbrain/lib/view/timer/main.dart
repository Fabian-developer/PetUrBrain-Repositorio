import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../utility/Pointer.dart';

// In seconds
const int TIMER_DURATION = 200;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hora de estudos'),
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
              Text('Iniciar/Parar som da chuva'),
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
