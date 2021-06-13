import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:one_context/one_context.dart';

import 'bloc/Home.dart';
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
    languagesList: ['en', 'pt'],
    assetsDirectory: 'lib/assets/locale/',
  );

  await Firebase.initializeApp();

  MobileAds.instance.initialize();

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
            '/credits': (BuildContext context) => Credits(),
            '/intro': (BuildContext context) => Intro(),
            '/home': (BuildContext context) => Home(),
            '/myPets': (BuildContext context) => MyPets(),
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

/*
  Leo, já pensamos como serão os anúncios:
  um pequeno anúncio estático na parte de baixo das telas (tela do pet e tela do timer),
  no visor dos petcoins colocar um botão com ícone de +,
  o usuário ao clicar é convidado a assistir uma propaganda de 30 seg
  em troca de uma quantidade x de petcoins,
  criar um meio do timer não voltar do zero ao clicar no anúncio (anúncio da tela do timer)
*/