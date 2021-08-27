import 'package:peturbrain/bloc/Home.dart';
import 'package:peturbrain/component/Ad.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:restart_app/restart_app.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BlocHome>(builder: (context, bloc) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/reward');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Image.asset(
                        'lib/assets/petcoin.png',
                        height: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        bloc.cUser.petCoins.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.add_circle,
                        color: Theme.of(context).colorScheme.primaryVariant,
                        size: 22,
                      ),
                    ],
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
                    Expanded(
                      child: Text(
                        translator.translate('home01'),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primaryVariant,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.pets,
                      color: Theme.of(context).colorScheme.primaryVariant,
                    ),
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
                    Expanded(
                      child: Text(
                        translator.translate('home02'),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primaryVariant,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.add_circle,
                      color: Theme.of(context).colorScheme.primaryVariant,
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/choose');
                },
              ),
              TextButton(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        translator.translate('home05'),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primaryVariant,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.help,
                      color: Theme.of(context).colorScheme.primaryVariant,
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/tutorial');
                },
              ),
              TextButton(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        translator.translate('home06'),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primaryVariant,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.assignment_ind_rounded,
                      color: Theme.of(context).colorScheme.primaryVariant,
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/credits');
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
                  onChanged: (value) async {
                    await translator.setNewLanguage(
                      context,
                      newLanguage: value,
                      remember: true,
                      restart: true,
                    );
                    Navigator.pop(context);
                    Restart.restartApp();
                  },
                  value: translator.locale.languageCode,
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(
                  translator
                      .translate(bloc.getLevel() == 5 ? 'maxLevel' : 'home03'),
                  style: TextStyle(
                    fontSize: 28,
                    color: Theme.of(context).colorScheme.primaryVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Image.network(
                  bloc.getImage(),
                  fit: BoxFit.contain,
                ),
              ),
              if (bloc.getLevel() < 5)
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
                                        : 0) +
                                    1)
                                .toString(),
                        style: TextStyle(
                          fontSize: 22,
                          color: Theme.of(context).colorScheme.secondaryVariant,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SizedBox(
                          height: 25,
                          child: FAProgressBar(
                            animatedDuration: Duration(milliseconds: 500),
                            borderRadius: BorderRadius.circular(5),
                            currentValue: bloc.getCValue(),
                            maxValue: bloc.getMaxValue(),
                            progressColor:
                                Theme.of(context).colorScheme.secondaryVariant,
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.error,
                ),
                child: Text(
                  translator.translate('home04'),
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                onPressed: () => Navigator.pushNamed(context, '/timer'),
              ),
              Ad(),
            ],
          ),
        ),
      );
    });
  }
}
