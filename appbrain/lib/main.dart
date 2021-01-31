import 'package:flutter/material.dart';
import 'tela_escolha.dart';
import 'animal.dart';
import 'cards.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetUrBrain',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PetUrBrain',
        ),
      ),
      drawer: Drawer(),
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
                        builder: (BuildContext context) => EscolhaPet()));
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
      )),
    );
  }
}
