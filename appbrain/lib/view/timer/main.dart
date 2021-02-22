import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import '../../utility/Pointer.dart';

// In seconds
const int TIMER_DURATION = 2;

class Timer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
