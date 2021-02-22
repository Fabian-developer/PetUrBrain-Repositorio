import 'dart:math';

import 'package:bloc_pattern/bloc_pattern.dart';

import '../model/Animal.dart';

const int POINTS_TIMER = 10;

const List<int> LEVELS = [
  0,
  100,
  200,
  300,
  400,
  500,
];

class BlocHome extends BlocBase {
  List<Animal> animals = [
    Animal(
      id: 'a1',
      nome: 'Cachorro',
      saude: 90,
      estado: 'bem',
      images: [
        'https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/119509859/original/a4b4d447d4d4223232912ba81768f00177de6565/do-animal-dog-cat-pet-illustration-cartoon-caricature.png',
        'https://image.shutterstock.com/image-vector/cat-grey-cartoon-pet-isolated-260nw-1512744293.jpg',
        'https://img.pngio.com/owl-cartoon-images-stock-photos-vectors-shutterstock-cartoon-owl-260_280.jpg',
        'https://previews.123rf.com/images/refluo/refluo1511/refluo151100004/48258373-cartoon-ferret.jpg',
      ],
    ),
    Animal(
      id: 'a2',
      nome: 'Gato',
      saude: 90,
      estado: 'bem',
      images: [
        'https://image.shutterstock.com/image-vector/cat-grey-cartoon-pet-isolated-260nw-1512744293.jpg',
      ],
    ),
    Animal(
      id: 'a3',
      nome: 'Coruja',
      saude: 90,
      estado: 'bem',
      images: [
        'https://img.pngio.com/owl-cartoon-images-stock-photos-vectors-shutterstock-cartoon-owl-260_280.jpg',
      ],
    ),
    Animal(
      id: 'a4',
      nome: 'Furão',
      saude: 90,
      estado: 'bem',
      images: [
        'https://previews.123rf.com/images/refluo/refluo1511/refluo151100004/48258373-cartoon-ferret.jpg',
      ],
    ),
  ];

  int cAnimal = -1;

  void addPoints({
    int value = POINTS_TIMER,
  }) {
    animals[cAnimal].points += value;
    notifyListeners();
  }

  int getCValue() {
    if (getLevel() == 0) return animals[cAnimal].points;
    return animals[cAnimal].points - LEVELS[getLevel()];
  }

  String getImage() => animals[cAnimal].images[min(
        getLevel(),
        animals[cAnimal].images.length,
      )];

  int getLevel() =>
      LEVELS.length -
      1 -
      LEVELS.reversed.toList().indexWhere(
            (e) => animals[cAnimal].points >= e,
          );

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
