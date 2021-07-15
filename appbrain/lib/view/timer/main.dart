import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:peturbrain/component/Ad.dart';

import '../../utility/Pointer.dart';

// In seconds
const int TIMER_DURATION = 30;

const String RAIN_URL = 'https://www.soundjay.com/nature/rain-01.mp3';

class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> with SingleTickerProviderStateMixin {
  AnimationController controller;

  final CountDownController countController = CountDownController();

  final player = AudioPlayer();

  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(milliseconds: 250),
      vsync: this,
      value: 1,
    );
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
              child: Stack(
                children: [
                  CircularCountDownTimer(
                    autoStart: true,
                    controller: countController,
                    duration: TIMER_DURATION,
                    fillColor: Theme.of(context).colorScheme.primaryVariant,
                    height: MediaQuery.of(context).size.width * .7,
                    isReverse: true,
                    isReverseAnimation: false,
                    isTimerTextShown: true,
                    ringColor: Theme.of(context).colorScheme.primary,
                    strokeCap: StrokeCap.round,
                    strokeWidth: MediaQuery.of(context).size.width * .1,
                    textStyle:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
                    width: MediaQuery.of(context).size.width * .7,
                    onComplete: () {
                      Navigator.pop(context);
                      blocHome.addPoints();
                    },
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.width * .12,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          if (controller.value == 1) {
                            countController.pause();
                            controller.reverse();
                          } else {
                            countController.resume();
                            controller.forward();
                          }
                        },
                        child: AnimatedIcon(
                          color: Theme.of(context).colorScheme.primaryVariant,
                          icon: AnimatedIcons.play_pause,
                          progress: controller,
                          size: 48,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primaryVariant,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              height: 50,
              width: MediaQuery.of(context).size.width * .5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    translator.translate('timer02'),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primaryVariant,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              player.playing ? player.pause() : player.play();
            },
          ),
          const SizedBox(height: 10),
          Ad(),
        ],
      ),
    );
  }
}
