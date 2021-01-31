import 'package:flutter/material.dart';
import 'animal.dart';
import 'cards.dart';
import 'lista_animais.dart';

class EscolhaPet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    children: lista.map((x) {
                      return Cards(x);
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
