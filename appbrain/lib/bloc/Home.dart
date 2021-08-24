import 'dart:math';

import 'package:bloc_pattern/bloc_pattern.dart';

import '../model/Animal.dart';
import '../model/User.dart';

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
      nome: 'Charlie',
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
      cost: 100,
    ),
    ModelAnimal(
      id: 'a2',
      nome: 'Andy',
      saude: 90,
      estado: 'bem',
      images: [
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Panda%201%20(tamanho%20reduzido).png?alt=media&token=2fdf42a3-34eb-41de-b0e1-7fe4c18cdc66',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Panda%202%20(tamanho%20reduzido).png?alt=media&token=32fb0be4-7280-49d9-b88b-3b65fee23b15',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Panda%203%20(tamanho%20reduzido).png?alt=media&token=a4c3d0c1-ef97-48d8-94ed-5b27a87f06fc',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Panda%204%20(tamanho%20reduzido).png?alt=media&token=9f77ec06-2e3d-41f8-9b2f-f465686da97c',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Panda%205%20(tamanho%20reduzido).png?alt=media&token=0b1713e8-b99d-4d20-83d1-8dcba1a0cb75',
      ],
      points: 0,
      cost: 150,
    ),
    ModelAnimal(
      id: 'a3',
      nome: 'Lilo',
      saude: 90,
      estado: 'bem',
      images: [
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Gato%201%20(tamanho%20reduzido).png?alt=media&token=b218d445-171f-42cc-a49e-e3fe30ff1158',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Gato%202%20(tamanho%20reduzido).png?alt=media&token=c5f4b439-a1c2-4dca-b825-101fe0de55b6',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Gato%203(tamanho%20reduzido).png?alt=media&token=019ba5dd-a740-4644-b562-51e2530a302f',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Gato%204%20(tamanho%20reduzido).png?alt=media&token=4c29d142-2b0b-4ca2-ae13-90c98be34249',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Gato%205%20(tamanho%20reduzido).png?alt=media&token=e116b42b-e340-46e6-8924-7753ad6f97ba',
      ],
      points: 0,
      cost: 100,
    ),
    ModelAnimal(
      id: 'a4',
      nome: 'Dobby',
      saude: 90,
      estado: 'bem',
      images: [
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Hamster%201%20(tamanho%20reduzido).png?alt=media&token=f2a3a3ce-1c4e-4da3-bef9-e1cc084ef1a1',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Hamster%202%20(tamanho%20reduzido).png?alt=media&token=ad677fb0-9489-4949-bdf4-9a9345d823f9',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Hamster%203%20(tamanho%20reduzido).png?alt=media&token=caf882f9-e064-4d7a-b64f-05a800f93a92',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Hamster%204%20(tamanho%20reduzido).png?alt=media&token=bb12cea0-a42d-4fc1-8e65-6ce5383ac5b5',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Hamster%205%20(tamanho%20reduzido).png?alt=media&token=cd8dbe60-d7b7-4cbb-b521-2e7598fd457as',
      ],
      points: 0,
      cost: 140,
    ),
    ModelAnimal(
      id: 'a5',
      nome: 'Zippy',
      saude: 90,
      estado: 'bem',
      images: [
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Fur%C3%A3o%201%20(tamanho%20reduzido).png?alt=media&token=59988176-72fb-4288-8a54-bf0ca80af83b',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Fur%C3%A3o%202%20(tamanho%20reduzido).png?alt=media&token=4abc63bf-a5fc-4c19-bb72-5e2118fba1cd',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Fur%C3%A3o%203%20(tamanho%20reduzido).png?alt=media&token=07674ca4-455a-4ea8-925a-d180872a2f96',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Fur%C3%A3o%204%20(tamanho%20reduzido).png?alt=media&token=a9f7f21e-3e75-43f6-8c07-f66c06a48560',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Fur%C3%A3o%205%20(tamanho%20reduzido).png?alt=media&token=fa8827aa-cd52-4405-9e96-a9c5a3c8271c',
      ],
      points: 0,
      cost: 130,
    ),
    ModelAnimal(
        id: 'a6',
        nome: 'Edwiggy',
        saude: 90,
        estado: 'bem',
        images: [
          'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Coruja%201%20(tamanho%20reduzido).png?alt=media&token=64e52da4-c584-4302-8c21-6dfc160e12a6',
          'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Coruja%202%20(tamanho%20reduzido).png?alt=media&token=4f43ea40-6895-4ebf-841b-a10ec8ae2d07',
          'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Coruja%203%20(tamanho%20reduzido).png?alt=media&token=3550c042-e8d0-4cf9-8475-28aa7afa9f3b',
          'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Coruja%204%20(tamanho%20reduzido).png?alt=media&token=e5c563c2-5ffd-4059-8df2-c918b13efa0b',
          'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Coruja%205%20(tamanho%20reduzido).png?alt=media&token=8563e953-b90b-4296-87f2-cdea4e85f8d7',
        ],
        points: 0,
        cost: 160),
    ModelAnimal(
      id: 'a7',
      nome: 'Bingo',
      saude: 90,
      estado: 'bem',
      images: [
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Dino%201%20(tamanho%20reduzido).png?alt=media&token=29be7411-b18a-4c6c-91a7-a545e0b678f1',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Dino%202%20(tamanho%20reduzido).png?alt=media&token=a977ad76-c5ff-4e8b-b651-9e08053b4de0',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Dino%203%20(tamanho%20reduzido).png?alt=media&token=7c6ea52f-1ab2-4d7f-a72f-38c72bf2f543',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Dino%204%20(tamanho%20reduzido).png?alt=media&token=a0171ea3-b407-43e6-b5ac-db8bbbea0c59',
        'https://firebasestorage.googleapis.com/v0/b/peturbrain.appspot.com/o/Dino%205%20(tamanho%20reduzido).png?alt=media&token=6a1d893c-5595-4588-97ff-36fdeca9fae2',
      ],
      points: 0,
      cost: 180,
    ),
  ];

  ModelUser cUser;

  int cAnimal = 0;

  bool addAnimal(int value) {
    if (cUser.animals.length >= MAX_PETS ||
        (cUser.animals.length > 0 && cUser.petCoins < animals[value].cost))
      return false;

    if (cUser.animals.length > 0) cUser.petCoins -= animals[value].cost;

    cUser.addAnimal(animals[value]);

    setAnimal(cUser.animals.indexOf(animals[value]));
    notifyListeners();

    return true;
  }

  void addPoints({
    int value = POINTS_TIMER,
  }) async {
    cUser.addAnimalPoints(cAnimal, value, PETCOINS_TIMER);
    notifyListeners();
    await Future.delayed(Duration(milliseconds: 300));
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
      ModelAnimal aux = cUser.animals[0];
      cUser.animals[0] = cUser.animals[value];
      cUser.animals[value] = aux;
      cUser.sync();
      notifyListeners();
    }
  }
}
