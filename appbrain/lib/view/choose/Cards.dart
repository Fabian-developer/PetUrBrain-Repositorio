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
              primary: Theme.of(context).accentColor,
              elevation: 0,
              side: BorderSide(
                color: Theme.of(context).colorScheme.primaryVariant,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'lib/assets/petcoin.png',
                  height: 22,
                ),
                const SizedBox(width: 10),
                Text(
                  blocHome.cUser.animals.length > 0
                      ? animal.cost.toString()
                      : translator.translate('choose01'),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryVariant,
                    fontSize: 16,
                  ),
                ),
              ],
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
