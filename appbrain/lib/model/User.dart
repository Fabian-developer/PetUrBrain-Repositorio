import 'package:appbrain/function/Cache.dart';
import 'package:appbrain/model/Animal.dart';

class ModelUser {
  ModelUser() {
    this.animals = [];
    this.petCoins = 0;
  }

  ModelUser.fromJson(Map<String, dynamic> json)
      : this.animals = json['animals']
            .cast<Map<String, dynamic>>()
            .map((Map<String, dynamic> e) => Animal(
                  cost: e['cost'],
                  estado: e['estado'],
                  id: e['id'],
                  images: e['images'].cast<String>(),
                  nome: e['nome'],
                  points: e['points'],
                  saude: e['saude'],
                ))
            .toList()
            .cast<Animal>(),
        this.petCoins = json['petCoins'];

  int petCoins;
  List<Animal> animals;

  void addAnimal(Animal animal) {
    if (animals.contains(animal)) return;

    animals.add(animal);

    _sync();
  }

  void addAnimalPoints(int index, int points, int coins) {
    petCoins += coins;
    animals[index].points += points;
    _sync();
  }

  void _sync() {
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
