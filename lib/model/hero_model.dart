class HeroModel {
  String? id, name, civil, universe, image, imagePath;

  HeroModel(
      {this.id,
      this.name,
      this.civil,
      this.universe,
      this.image,
      this.imagePath});

  HeroModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    civil = json['civil'];
    universe = json['universe'];
    image = json['image'];
    imagePath = json['imagePath'];
  }
}
