import 'package:appbrain/bloc/Home.dart';
import 'package:appbrain/function/Cache.dart';
import 'package:appbrain/model/Animal.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

part 'Cards.dart';
part 'EscolhaPet.dart';

class Choose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BlocHome>(builder: (context, bloc) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Você precisa escolher seu Pet!',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.purple,
                ),
              ),
              Image.network(
                'https://st4.depositphotos.com/11953928/40150/v/1600/depositphotos_401502362-stock-illustration-pet-shop-cute-little-puppies.jpg',
              ),
              Container(
                height: 50,
                width: 300,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => EscolhaPet(bloc),
                      ),
                    );
                  },
                  color: Colors.purple,
                  child: Text(
                    'Escolher!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
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
