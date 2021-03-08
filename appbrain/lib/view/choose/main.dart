import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import '../../bloc/Home.dart';
import '../../function/Cache.dart';
import '../../model/Animal.dart';

part 'Cards.dart';

class Choose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BlocHome>(builder: (context, bloc) {
      return Scaffold(
        appBar: AppBar(
          title: Text('PetUrBrain'),
        ),
        body: Container(
          color: Colors.purple[100],
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Column(
                      children: [
                        for (ModelAnimal animal in bloc.animals)
                          Cards(
                            bloc,
                            animal: animal,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
