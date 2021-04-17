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
      color: Theme.of(context).accentColor,
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
              color: Theme.of(context).colorScheme.primaryVariant,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).colorScheme.primaryVariant,
            ),
            child: Text(
              cUser.animals.length > 0
                  ? animal.cost.toString()
                  : translator.translate('choose01'),
              style: TextStyle(color: Theme.of(context).accentColor),
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
