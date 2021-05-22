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
        'https://lh3.googleusercontent.com/pw/ACtC-3cuNmvk_3G9Mdd6doNUSoKpe1YBQQvmBuRN46z00l45Ss7c-Q8MNUfHqLAVFUzjvTKfn8oYVurvCMKfkev7JxqvYU3WE-2kjjSuIf6CNxJRKCkqx1qVQDVYKBtPCkNqCxEYJ68ieHZ24o7kZfWJ7w9_=w874-h948-no?authuser=0',
        'https://lh3.googleusercontent.com/pw/ACtC-3cuNmvk_3G9Mdd6doNUSoKpe1YBQQvmBuRN46z00l45Ss7c-Q8MNUfHqLAVFUzjvTKfn8oYVurvCMKfkev7JxqvYU3WE-2kjjSuIf6CNxJRKCkqx1qVQDVYKBtPCkNqCxEYJ68ieHZ24o7kZfWJ7w9_=w874-h948-no?authuser=0',
        'https://lh3.googleusercontent.com/pw/ACtC-3cuNmvk_3G9Mdd6doNUSoKpe1YBQQvmBuRN46z00l45Ss7c-Q8MNUfHqLAVFUzjvTKfn8oYVurvCMKfkev7JxqvYU3WE-2kjjSuIf6CNxJRKCkqx1qVQDVYKBtPCkNqCxEYJ68ieHZ24o7kZfWJ7w9_=w874-h948-no?authuser=0',
        'https://lh3.googleusercontent.com/pw/ACtC-3cuNmvk_3G9Mdd6doNUSoKpe1YBQQvmBuRN46z00l45Ss7c-Q8MNUfHqLAVFUzjvTKfn8oYVurvCMKfkev7JxqvYU3WE-2kjjSuIf6CNxJRKCkqx1qVQDVYKBtPCkNqCxEYJ68ieHZ24o7kZfWJ7w9_=w874-h948-no?authuser=0',
      ],
      points: 0,
    ),
    ModelAnimal(
      id: 'a2',
      nome: 'Gato',
      saude: 90,
      estado: 'bem',
      images: [
        'https://lh3.googleusercontent.com/pw/ACtC-3dBBZkXsnZhspJAUf_TqlBe9x-UJdygPPK0nh9ySwW_-ktraZs2zznvEc2LyLdu9LokTkw7rSmEUD7dBexwCAoA2yvT7oF4bZVfJs0SFUw54v3FabwBAr4v3XDBPMRm-AYeXsGUhPvSpJxkzu6meTv7=w465-h600-no?authuser=0',
      ],
      points: 0,
    ),
    ModelAnimal(
      id: 'a3',
      nome: 'Coruja',
      saude: 90,
      estado: 'bem',
      images: [
        'https://img.pngio.com/owl-cartoon-images-stock-photos-vectors-shutterstock-cartoon-owl-260_280.jpg',
      ],
      points: 0,
    ),
    ModelAnimal(
      id: 'a3',
      nome: 'Coruja',
      saude: 90,
      estado: 'bem',
      images: [
        'https://img.pngio.com/owl-cartoon-images-stock-photos-vectors-shutterstock-cartoon-owl-260_280.jpg',
      ],
      points: 0,
    ),
    ModelAnimal(
      id: 'a3',
      nome: 'Coruja',
      saude: 90,
      estado: 'bem',
      images: [
        'https://img.pngio.com/owl-cartoon-images-stock-photos-vectors-shutterstock-cartoon-owl-260_280.jpg',
      ],
      points: 0,
    ),
    ModelAnimal(
      id: 'a3',
      nome: 'Coruja',
      saude: 90,
      estado: 'bem',
      images: [
        'https://img.pngio.com/owl-cartoon-images-stock-photos-vectors-shutterstock-cartoon-owl-260_280.jpg',
      ],
      points: 0,
    ),
    ModelAnimal(
      id: 'a4',
      nome: 'Furão',
      saude: 90,
      estado: 'bem',
      images: [
        'https://previews.123rf.com/images/refluo/refluo1511/refluo151100004/48258373-cartoon-ferret.jpg',
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
