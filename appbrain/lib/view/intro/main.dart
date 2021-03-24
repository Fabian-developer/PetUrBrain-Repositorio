import 'package:appbrain/bloc/Home.dart';
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
                'https://st4.depositphotos.com/11953928/40150/v/1600/depositphotos_401502362-stock-illustration-pet-shop-cute-little-puppies.jpg',
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
