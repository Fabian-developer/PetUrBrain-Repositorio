import 'package:bloc_pattern/bloc_pattern.dart';

import '../model/Animal.dart';

class BlocHome extends BlocBase {
  List<Animal> animals = [
    Animal(
      id: 'a1',
      nome: 'Cachorro',
      saude: 90,
      estado: 'bem',
      imageUrl:
          'https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/119509859/original/a4b4d447d4d4223232912ba81768f00177de6565/do-animal-dog-cat-pet-illustration-cartoon-caricature.png',
    ),
    Animal(
      id: 'a2',
      nome: 'Gato',
      saude: 90,
      estado: 'bem',
      imageUrl:
          'https://image.shutterstock.com/image-vector/cat-grey-cartoon-pet-isolated-260nw-1512744293.jpg',
    ),
    Animal(
      id: 'a3',
      nome: 'Coruja',
      saude: 90,
      estado: 'bem',
      imageUrl:
          'https://img.pngio.com/owl-cartoon-images-stock-photos-vectors-shutterstock-cartoon-owl-260_280.jpg',
    ),
    Animal(
      id: 'a4',
      nome: 'Furão',
      saude: 90,
      estado: 'bem',
      imageUrl:
          'https://previews.123rf.com/images/refluo/refluo1511/refluo151100004/48258373-cartoon-ferret.jpg',
    ),
  ];

  int cAnimal = -1;

  void setAnimal(int value) {
    if (cAnimal != value) {
      cAnimal = value;
      notifyListeners();
    }
  }
}
