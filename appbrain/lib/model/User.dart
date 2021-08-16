import 'package:peturbrain/function/Cache.dart';
import 'package:peturbrain/model/Animal.dart';

class ModelUser {
  ModelUser() {
    this.animals = [];
    this.petCoins = 0;
  }

  ModelUser.fromJson(Map<String, dynamic> json)
      : this.animals = json['animals']
            .cast<Map<String, dynamic>>()
            .map((Map<String, dynamic> e) => ModelAnimal(
                  cost: e['cost'],
                  estado: e['estado'],
                  id: e['id'],
                  images: e['images'].cast<String>(),
                  nome: e['nome'],
                  points: e['points'],
                  saude: e['saude'],
                ))
            .toList()
            .cast<ModelAnimal>(),
        this.petCoins = json['petCoins'];

  int petCoins;
  List<ModelAnimal> animals;

  void addAnimal(ModelAnimal animal) {
    if (animals.contains(animal)) return;

    animals.add(animal);

    sync();
  }

  void addAnimalPoints(int index, int points, int coins) {
    petCoins += coins;
    animals[index].points += points;
    sync();
  }

  void sync() {
    FunctionCache.saveUser(this);
  }

  Map<String, dynamic> toJson() => {
        'animals': animals
            .map(
              (e) => {
                'cost': e.cost,
                'estado': e.estado,
                'id': e.id,
                'images': e.images,
                'nome': e.nome,
                'points': e.points,
                'saude': e.saude,
              },
            )
            .toList(),
        'petCoins': petCoins,
      };
}
