const int DEFAULT_COST = 10;

class ModelAnimal {
  int
      //
      cost,
      points;

  List<String> images;

  Object saude;

  String
      //
      estado,
      id,
      nome;

  ModelAnimal({
    this.cost,
    this.estado,
    this.id,
    this.images,
    this.nome,
    this.points,
    this.saude,
  }) {
    this.cost = this.cost ?? DEFAULT_COST;
    this.points = this.points ?? 0;
  }
}
