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
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%201%20(tamanho%20reduzido).png?alt=media&token=2e630686-44db-47ec-9316-760b59d272e9',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%202%20(tamanho%20reduzido).png?alt=media&token=c13a4c10-c471-4718-b31e-80e9f5a642c0',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%203%20(tamanho%20reduzido).png?alt=media&token=280ff29d-578a-47ee-abd6-39815994556c',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%204%20(tamanho%20reduzido).png?alt=media&token=414828a1-8fc3-494b-943d-54b386b0c7af',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%205%20(tamanho%20reduzido).png?alt=media&token=5fede1cd-4cef-441a-87fd-0e4ee6d76cc2',
      ],
      points: 0,
    ),
    ModelAnimal(
      id: 'a2',
      nome: 'Panda',
      saude: 90,
      estado: 'bem',
      images: [
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%201%20(tamanho%20reduzido).png?alt=media&token=2e630686-44db-47ec-9316-760b59d272e9',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%202%20(tamanho%20reduzido).png?alt=media&token=c13a4c10-c471-4718-b31e-80e9f5a642c0',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%203%20(tamanho%20reduzido).png?alt=media&token=280ff29d-578a-47ee-abd6-39815994556c',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%204%20(tamanho%20reduzido).png?alt=media&token=414828a1-8fc3-494b-943d-54b386b0c7af',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%205%20(tamanho%20reduzido).png?alt=media&token=5fede1cd-4cef-441a-87fd-0e4ee6d76cc2',
      ],
      points: 0,
    ),
    ModelAnimal(
      id: 'a3',
      nome: 'Gato',
      saude: 90,
      estado: 'bem',
      images: [
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%201%20(tamanho%20reduzido).png?alt=media&token=2e630686-44db-47ec-9316-760b59d272e9',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%202%20(tamanho%20reduzido).png?alt=media&token=c13a4c10-c471-4718-b31e-80e9f5a642c0',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%203%20(tamanho%20reduzido).png?alt=media&token=280ff29d-578a-47ee-abd6-39815994556c',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%204%20(tamanho%20reduzido).png?alt=media&token=414828a1-8fc3-494b-943d-54b386b0c7af',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%205%20(tamanho%20reduzido).png?alt=media&token=5fede1cd-4cef-441a-87fd-0e4ee6d76cc2',
      ],
      points: 0,
    ),
    ModelAnimal(
      id: 'a4',
      nome: 'Hamster',
      saude: 90,
      estado: 'bem',
      images: [
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%201%20(tamanho%20reduzido).png?alt=media&token=2e630686-44db-47ec-9316-760b59d272e9',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%202%20(tamanho%20reduzido).png?alt=media&token=c13a4c10-c471-4718-b31e-80e9f5a642c0',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%203%20(tamanho%20reduzido).png?alt=media&token=280ff29d-578a-47ee-abd6-39815994556c',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%204%20(tamanho%20reduzido).png?alt=media&token=414828a1-8fc3-494b-943d-54b386b0c7af',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%205%20(tamanho%20reduzido).png?alt=media&token=5fede1cd-4cef-441a-87fd-0e4ee6d76cc2',
      ],
      points: 0,
    ),
    ModelAnimal(
      id: 'a5',
      nome: 'Furão',
      saude: 90,
      estado: 'bem',
      images: [
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%201%20(tamanho%20reduzido).png?alt=media&token=2e630686-44db-47ec-9316-760b59d272e9',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%202%20(tamanho%20reduzido).png?alt=media&token=c13a4c10-c471-4718-b31e-80e9f5a642c0',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%203%20(tamanho%20reduzido).png?alt=media&token=280ff29d-578a-47ee-abd6-39815994556c',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%204%20(tamanho%20reduzido).png?alt=media&token=414828a1-8fc3-494b-943d-54b386b0c7af',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%205%20(tamanho%20reduzido).png?alt=media&token=5fede1cd-4cef-441a-87fd-0e4ee6d76cc2',
      ],
      points: 0,
    ),
    ModelAnimal(
      id: 'a6',
      nome: 'Coruja',
      saude: 90,
      estado: 'bem',
      images: [
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%201%20(tamanho%20reduzido).png?alt=media&token=2e630686-44db-47ec-9316-760b59d272e9',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%202%20(tamanho%20reduzido).png?alt=media&token=c13a4c10-c471-4718-b31e-80e9f5a642c0',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%203%20(tamanho%20reduzido).png?alt=media&token=280ff29d-578a-47ee-abd6-39815994556c',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%204%20(tamanho%20reduzido).png?alt=media&token=414828a1-8fc3-494b-943d-54b386b0c7af',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%205%20(tamanho%20reduzido).png?alt=media&token=5fede1cd-4cef-441a-87fd-0e4ee6d76cc2',
      ],
      points: 0,
    ),
    ModelAnimal(
      id: 'a7',
      nome: 'Dino',
      saude: 90,
      estado: 'bem',
      images: [
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%201%20(tamanho%20reduzido).png?alt=media&token=2e630686-44db-47ec-9316-760b59d272e9',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%202%20(tamanho%20reduzido).png?alt=media&token=c13a4c10-c471-4718-b31e-80e9f5a642c0',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%203%20(tamanho%20reduzido).png?alt=media&token=280ff29d-578a-47ee-abd6-39815994556c',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%204%20(tamanho%20reduzido).png?alt=media&token=414828a1-8fc3-494b-943d-54b386b0c7af',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Doggo%205%20(tamanho%20reduzido).png?alt=media&token=5fede1cd-4cef-441a-87fd-0e4ee6d76cc2',
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
