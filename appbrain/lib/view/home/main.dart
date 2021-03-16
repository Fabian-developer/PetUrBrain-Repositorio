import 'package:appbrain/bloc/Home.dart';
import 'package:appbrain/utility/Pointer.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BlocHome>(builder: (context, bloc) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'PetCoins: ' + cUser.petCoins.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
          title: Text(
            'PetUrBrain',
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              TextButton(
                child: Row(
                  children: [
                    Text(translator.translate('home01')),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/myPets');
                },
              ),
              TextButton(
                child: Row(
                  children: [
                    Text(translator.translate('home02')),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/choose');
                },
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  translator.translate('locale'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButton<String>(
                  items: List.generate(
                    translator.locals().length,
                    (index) => DropdownMenuItem(
                      child: Text(translator
                          .locals()
                          .toList()[index]
                          .languageCode
                          .toUpperCase()),
                      value: translator.locals().toList()[index].languageCode,
                    ),
                  ),
                  onChanged: (value) {
                    translator.setNewLanguage(
                      context,
                      newLanguage: value,
                      remember: true,
                      restart: true,
                    );
                    Navigator.pop(context);
                  },
                  value: translator.locale.languageCode,
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                translator.translate('home03'),
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.purple,
                ),
              ),
              Image.network(
                bloc.getImage(),
                height: 400,
                width: 550,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Text(
                      'Lv ' +
                          (bloc.getLevel() +
                                  (bloc.getCValue() >= bloc.getMaxValue()
                                      ? 1
                                      : 0))
                              .toString(),
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: SizedBox(
                        height: 25,
                        child: FAProgressBar(
                          animatedDuration: Duration(milliseconds: 500),
                          borderRadius: 5,
                          currentValue: bloc.getCValue(),
                          maxValue: bloc.getMaxValue(),
                          progressColor: Colors.orange,
                          backgroundColor: Colors.orange[200],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                color: Colors.green,
                child: Text(
                  translator.translate('home04'),
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => Navigator.pushNamed(context, '/timer'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
