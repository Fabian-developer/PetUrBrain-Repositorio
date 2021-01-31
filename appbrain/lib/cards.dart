import 'package:flutter/material.dart';
import 'animal.dart';

class Cards extends StatelessWidget {
  final Animal animal;

  Cards(this.animal);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            animal.imageUrl,
            height: 300,
            width: 350,
          ),
          Text(
            animal.nome,
            style: TextStyle(
              fontSize: 20,
              color: Colors.purple,
            ),
          ),
          RaisedButton(
            color: Colors.purple,
            child: Text(
              'Escolher esse!',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          )
        ],
      ),
      elevation: 6,
    );
  }
}
