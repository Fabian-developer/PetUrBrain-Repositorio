import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:one_context/one_context.dart';

import 'bloc/Home.dart';
import 'utility/CustomTheme.dart';
import 'view/choose/main.dart';
import 'view/home/main.dart';
import 'view/intro/main.dart';
import 'view/myPets/main.dart';
import 'view/timer/main.dart';
import 'view/router/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await translator.init(
    localeDefault: LocalizationDefaultType.device,
    languagesList: ['en', 'pt'],
    assetsDirectory: 'lib/assets/locale/',
  );

  await Firebase.initializeApp();

  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocalizedApp(
      child: BlocProvider(
        blocs: [
          Bloc<BlocHome>((dynamic i) => BlocHome()),
        ],
        child: MaterialApp(
          builder: OneContext().builder,
          navigatorKey: OneContext().key,
          localizationsDelegates: translator.delegates,
          locale: translator.locale,
          supportedLocales: translator.locals(),
          routes: {
            '/choose': (BuildContext context) => Choose(),
            '/intro': (BuildContext context) => Intro(),
            '/home': (BuildContext context) => Home(),
            '/myPets': (BuildContext context) => MyPets(),
            '/timer': (BuildContext context) => Timer(),
          },
          title: 'PetUrBrain',
          theme: CustomTheme.light,
          home: Router(),
        ),
      ),
    );
  }
}
