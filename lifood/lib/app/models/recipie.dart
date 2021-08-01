class Recipie {
  final int id;
  final String name;
  final String image;
  final String totalTime;

  Recipie({
    this.id,
    this.name,
    this.image,
    this.totalTime,
  });

  factory Recipie.fromJson(dynamic json) {
    return Recipie(
      id: json['id'],
      name: json['name'] as String,
      totalTime: json['totalTime'] as String,
      image: json['images'][0]['hostedLargeUrl'] as String,
    );
  }

  static List<Recipie> recipiesFromSnapshot(List snapshot) {
    return snapshot.map((data) => Recipie.fromJson(data)).toList();
  }

  @override
  String toString() {
    return 'id: $id, name: $name, totalTime: $totalTime, image: $image';
  }
}
