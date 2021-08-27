import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:one_context/one_context.dart';

import 'bloc/Home.dart';
import 'component/RewardAd.dart';
import 'utility/CustomTheme.dart';
import 'view/choose/main.dart';
import 'view/credits/main.dart';
import 'view/home/main.dart';
import 'view/intro/main.dart';
import 'view/myPets/main.dart';
import 'view/timer/main.dart';
import 'view/tutorial/main.dart';
import 'view/router/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await translator.init(
    localeDefault: LocalizationDefaultType.device,
    languagesList: ['en', 'pt', 'es'],
    assetsDirectory: 'lib/assets/locale/',
  );

  await Firebase.initializeApp();

  MobileAds.instance.initialize();

  runApp(MyApp());
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
            '/credits': (BuildContext context) => Credits(),
            '/intro': (BuildContext context) => Intro(),
            '/home': (BuildContext context) => Home(),
            '/myPets': (BuildContext context) => MyPets(),
            '/reward': (BuildContext context) => RewardAd(),
            '/timer': (BuildContext context) => Timer(),
            '/tutorial': (BuildContext context) => Tutorial(),
          },
          title: 'PetUrBrain',
          theme: CustomTheme.light,
          home: Router(),
        ),
      ),
    );
  }
}
