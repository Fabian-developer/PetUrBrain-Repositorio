import 'dart:math';

import 'package:peturbrain/utility/Pointer.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

import '../model/Animal.dart';

const int
    //
    MAX_PETS = 8,
    PETCOINS_TIMER = 5,
    POINTS_TIMER = 10;

const List<int> LEVELS = [
  0,
  100,
  200,
  300,
  400,
  500,
];

class BlocHome extends BlocBase {
  List<ModelAnimal> animals = [
    ModelAnimal(
      id: 'a1',
      nome: 'Cachorro',
      saude: 90,
      estado: 'bem',
      images: [
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%201.png?alt=media&token=59e5981a-2d5e-4b2c-8423-8d3cef7e603e',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%202%20(1).png?alt=media&token=1d60e9c4-a250-4b52-b895-801cc4569b85',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%203.png?alt=media&token=a57e75bb-d65d-415f-b4b8-44825b72f80d',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%204.png?alt=media&token=3a367160-b999-4b47-aa00-820ec98e0af5',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%205.png?alt=media&token=eef49d71-0352-4d4f-af7f-7cdc637da585',
      ],
      points: 0,
    ),
    ModelAnimal(
      id: 'a2',
      nome: 'Panda',
      saude: 90,
      estado: 'bem',
      images: [
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Panda%201.png?alt=media&token=e21e8461-60c0-4a90-890f-9591d25099d6',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Panda%202.png?alt=media&token=ccfd0c45-ed34-4d68-89fe-095bb633eda4',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Panda%203%20(1).png?alt=media&token=58a3ffab-4529-4777-afc4-59d1440df558',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Panda%204.png?alt=media&token=c523606c-e1e5-4549-961f-7b3180b9a3a6',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Panda%205.png?alt=media&token=00aa6640-0b86-4afa-af79-6a38ae54d334',
      ],
      points: 0,
    ),
    ModelAnimal(
      id: 'a3',
      nome: 'Gato',
      saude: 90,
      estado: 'bem',
      images: [
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Gato%201%20(1).png?alt=media&token=2c362be9-0fa4-41e5-a1fd-a24ed7a88dfa',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Gato%202.png?alt=media&token=019b45f8-663c-4f29-bb53-27d84f00fbd7',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Gato%203.png?alt=media&token=2ba97f6e-776d-4f2a-8fd5-4505e8905e50',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Gato%204.png?alt=media&token=77362054-6c0b-42b9-835f-28b8e38958c2',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Gato%205.png?alt=media&token=800e8bdd-dd74-4b94-845d-77ac11e776f8',
      ],
      points: 0,
    ),
    ModelAnimal(
      id: 'a4',
      nome: 'Hamster',
      saude: 90,
      estado: 'bem',
      images: [
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Hamster%201.png?alt=media&token=3e2bdeb3-32d6-4d02-8518-19ab28216906',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Hamster%202.png?alt=media&token=6ca6e8bc-7c0b-4208-9c3c-7285973ad8ea',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Hamster%203.png?alt=media&token=21bc23b5-fe71-495b-9eb2-882272dd0fc4',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Hamster%204.2.png?alt=media&token=46173907-dcc6-4fd8-b9fa-e1ad9e21b204',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Hamster%205.png?alt=media&token=74dbd9af-4d72-48a3-a9f7-64d1b5c4dea0',
      ],
      points: 0,
    ),
    ModelAnimal(
      id: 'a5',
      nome: 'Furão',
      saude: 90,
      estado: 'bem',
      images: [
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Fur%C3%A3o%201.png?alt=media&token=442b1a77-54fe-4f3a-ab1a-64792bb462ed',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Fur%C3%A3o%202.png?alt=media&token=8505b5bb-2369-45b4-91bd-802750cfda34',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Fur%C3%A3o%203.png?alt=media&token=62095c0d-1a9e-42c6-8fdc-84655fffa1e4',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Fur%C3%A3o%204.png?alt=media&token=a81732b3-1962-4fc1-9065-6be1c7e25847',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Fur%C3%A3o%205.png?alt=media&token=ba623987-62ac-42fa-861d-15f38e355f39',
      ],
      points: 0,
    ),
    ModelAnimal(
      id: 'a6',
      nome: 'Coruja',
      saude: 90,
      estado: 'bem',
      images: [
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Coruja%201.png?alt=media&token=dcde6f6c-848f-4793-b0cd-974cd9764f7c',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Coruja%202.png?alt=media&token=bdafeaf1-90e3-4d16-8b13-142ea5e2b81c',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Coruja%203.png?alt=media&token=e31733cb-188f-4a93-aec0-07632149bcff',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Coruja%204.png?alt=media&token=ddd186f3-5994-4312-aed1-fbbf6f79483f',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Coruja%205.png?alt=media&token=f9b26cb0-374d-411e-944a-062924191f35',
      ],
      points: 0,
    ),
    ModelAnimal(
      id: 'a7',
      nome: 'Dino',
      saude: 90,
      estado: 'bem',
      images: [
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Dino%201.png?alt=media&token=8d6760b5-17a1-48e9-9347-8811935c281f',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Dino%202.png?alt=media&token=c07dd0d3-c5b5-4250-afaa-960fd8c7eae3',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Dino%203.png?alt=media&token=801c1fc2-8e93-474c-8dea-4740497c70ac',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Dino%204.png?alt=media&token=477b49b3-37ac-4e98-b795-d4e04187086e',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Dino%205.png?alt=media&token=07c6aec3-1089-4f34-b41d-6cee3c317f09',
      ],
      points: 0,
    ),
  ];

  int cAnimal = 0;

  bool addAnimal(int value) {
    print(animals[value].cost);
    if (cUser.animals.length >= MAX_PETS ||
        (cUser.animals.length > 0 && cUser.petCoins < animals[value].cost))
      return false;

    if (cUser.animals.length > 0) cUser.petCoins -= animals[value].cost;

    cUser.addAnimal(animals[value]);

    cAnimal = cUser.animals.indexOf(animals[value]);
    notifyListeners();

    return true;
  }

  void addPoints({
    int value = POINTS_TIMER,
  }) {
    cUser.addAnimalPoints(cAnimal, value, PETCOINS_TIMER);
    notifyListeners();
  }

  int getCValue() {
    if (getLevel() == 0) return cUser.animals[cAnimal].points;
    return cUser.animals[cAnimal].points - LEVELS[getLevel()];
  }

  String getImage({int index}) => cUser.animals[index ?? cAnimal].images[min(
        getLevel(index: index),
        cUser.animals[index ?? cAnimal].images.length - 1,
      )];

  int getLevel({int index}) {
    return LEVELS.length -
        1 -
        LEVELS.reversed.toList().indexWhere(
              (e) => cUser.animals[index ?? cAnimal].points >= e,
            );
  }

  int getMaxValue() {
    if (getLevel() == 0)
      return LEVELS[1];
    else
      return LEVELS[getLevel()] - LEVELS[getLevel() - 1];
  }

  void setAnimal(int value) {
    if (cAnimal != value) {
      cAnimal = value;
      notifyListeners();
    }
  }
}
