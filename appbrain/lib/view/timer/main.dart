import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:peturbrain/component/Ad.dart';

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
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: CircularCountDownTimer(
                autoStart: true,
                duration: TIMER_DURATION,
                fillColor: Theme.of(context).colorScheme.primaryVariant,
                height: MediaQuery.of(context).size.width * .7,
                isReverse: true,
                isReverseAnimation: false,
                isTimerTextShown: true,
                ringColor: Theme.of(context).colorScheme.primary,
                strokeCap: StrokeCap.round,
                strokeWidth: MediaQuery.of(context).size.width * .1,
                textStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
                width: MediaQuery.of(context).size.width * .7,
                onComplete: () {
                  Navigator.pop(context);
                  blocHome.addPoints();
                },
              ),
            ),
          ),
          Container(
            height: 50,
            child: TextButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    translator.translate('timer02'),
                    style: TextStyle(color: Colors.purple),
                  ),
                ],
              ),
              onPressed: () {
                player.playing ? player.pause() : player.play();
              },
            ),
          ),
          Ad(),
        ],
      ),
    );
  }
}
