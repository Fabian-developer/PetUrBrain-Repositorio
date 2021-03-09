part of 'main.dart';

class Cards extends StatelessWidget {
  Cards(
    this.bloc, {
    this.animal,
  });

  final ModelAnimal animal;
  final BlocHome bloc;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            animal.images[0],
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
              cUser.animals.length > 0
                  ? animal.cost.toString()
                  : 'Escolher esse!',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              bloc.addAnimal(bloc.animals.indexOf(animal));
              FunctionCache.redirectTo('/home');
            },
          )
        ],
      ),
      elevation: 6,
    );
  }
}
