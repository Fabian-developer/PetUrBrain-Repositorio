import 'package:appbrain/view/choose/main.dart';
import 'package:appbrain/view/home/main.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:one_context/one_context.dart';

import 'bloc/Home.dart';
import 'view/timer/main.dart';
import 'view/router/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc<BlocHome>((dynamic i) => BlocHome()),
      ],
      child: MaterialApp(
        builder: OneContext().builder,
        navigatorKey: OneContext().key,
        routes: {
          '/choose': (BuildContext context) => Choose(),
          '/home': (BuildContext context) => Home(),
          '/timer': (BuildContext context) => Timer(),
        },
        title: 'PetUrBrain',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Router(),
      ),
    );
  }
}
