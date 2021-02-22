import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'model/Animal.dart';

import 'bloc/Home.dart';

part 'cards.dart';
part 'tela_escolha.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc<BlocHome>((dynamic i) => BlocHome()),
      ],
      child: MaterialApp(
        title: 'PetUrBrain',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: MyHomePage(),
      ),
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
    return Consumer<BlocHome>(builder: (context, bloc) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'PetUrBrain',
          ),
        ),
        drawer: Drawer(),
        body: (bloc.cAnimal == -1)
            ? Center(
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
                              builder: (BuildContext context) =>
                                  EscolhaPet(bloc),
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
              )
            : Center(
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
                    Text(
                      'Nível 1',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.orange,
                      ),
                    ),
                    Image.network(
                      bloc.animals[bloc.cAnimal].imageUrl,
                      height: 400,
                      width: 550,
                    ),
                    RaisedButton(
                      color: Colors.green,
                      child: Text(
                        'Iniciar hora de estudo',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
