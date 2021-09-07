import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:peturbrain/component/Ad.dart';

import '../../utility/Pointer.dart';

// In seconds
const int TIMER_DURATION = 7;

const String
//
    DONE_URL =
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/som_conclusao_estudo.mp3?alt=media&token=41d8c7a8-507b-4ef6-8419-96ec0626cc8e',
    RAIN_URL =
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Rain%20On%20Rooftop.mp3?alt=media&token=670903c7-bce6-49d8-b2d5-8f1fbc36cd52';

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
    player.setLoopMode(LoopMode.all);
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
        title: Text('timer01'.tr()),
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
                    onComplete: () async {
                      if (player.playing) player.stop();
                      player.setUrl(DONE_URL);
                      var _wait = await player.load();
                      player.play();
                      await Future.delayed(_wait + Duration(seconds: 1));

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
              width: MediaQuery.of(context).size.width * .7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'timer02'.tr(),
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
