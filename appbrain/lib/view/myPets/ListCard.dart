part of 'main.dart';

class ListCard extends StatelessWidget {
  ListCard(this.bloc, this.index);

  final BlocHome bloc;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black.withOpacity(.1),
            offset: Offset(2, 2),
          )
        ],
        color: Theme.of(context).accentColor,
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              bloc.getImage(index: index),
              fit: BoxFit.fitWidth,
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.primaryVariant,
            height: 0,
          ),
          Expanded(
            child: TextButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'myPets01'.tr(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primaryVariant,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                bloc.setAnimal(index);
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
