part of 'main.dart';

class EscolhaPet extends StatelessWidget {
  EscolhaPet(this.bloc);

  final BlocHome bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PetUrBrain'),
      ),
      body: Container(
        color: Colors.purple[100],
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: Column(
                    children: [
                      for (Animal animal in bloc.animals)
                        Cards(
                          bloc,
                          animal: animal,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
