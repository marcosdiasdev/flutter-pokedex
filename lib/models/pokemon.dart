class Pokemon {
  final int id;
  final String name;
  final Sprite sprite;

  Pokemon({this.id, this.name, this.sprite});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      sprite: Sprite.fromJson(json['sprites']),
    );
  }
}

class Sprite {
  String back_default;
  String front_default;

  Sprite({this.back_default, this.front_default});

  factory Sprite.fromJson(Map<String, dynamic> json) {
    return Sprite(
      back_default: json['back_default'],
      front_default: json['front_default'],
    );
  }
}