import 'package:peturbrain/bloc/Home.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BlocHome>(builder: (context, bloc) {
      return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                translator.translate('intro01'),
                style: TextStyle(
                  fontSize: 28,
                  color: Theme.of(context).colorScheme.primaryVariant,
                ),
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/imagem_abertura.jpeg?alt=media&token=125c3cac-9b39-4d96-8532-cbe3f9e83b77',
              ),
              Container(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primaryVariant,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/choose',
                    );
                  },
                  child: Text(
                    translator.translate('intro02'),
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
