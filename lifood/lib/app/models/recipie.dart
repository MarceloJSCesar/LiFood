class Recipe {
  final int id;
  final String name;
  final String image;
  final String rating;
  final double totalTime;

  Recipe({
    this.id,
    this.name,
    this.image,
    this.rating,
    this.totalTime,
  });

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      id: json['id'],
      name: json['name'] as String,
      totalTime: json['totalTime'],
      image: json['images'][0]['hostedLargeUrl'] as String,
    );
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) => Recipe.fromJson(data)).toList();
  }

  @override
  String toString() {
    return 'id: $id, name: $name, totalTime: $totalTime, image: $image';
  }
}
