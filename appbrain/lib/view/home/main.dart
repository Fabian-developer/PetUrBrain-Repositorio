import 'package:appbrain/bloc/Home.dart';
import 'package:appbrain/utility/Pointer.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

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
                    Text('Meus Pets'),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/myPets');
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Faça seu Pet evoluir!',
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
                  'Iniciar hora de estudo',
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
