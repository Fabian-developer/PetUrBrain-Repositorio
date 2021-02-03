part of 'main.dart';

class Cards extends StatelessWidget {
  Cards(
    this.bloc, {
    this.animal,
  });

  final Animal animal;
  final BlocHome bloc;

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
            onPressed: () {
              bloc.setAnimal(bloc.animals.indexOf(animal));
              Navigator.pop(context);
            },
          )
        ],
      ),
      elevation: 6,
    );
  }
}
