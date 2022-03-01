class Mproximamente {
  String id;
  String title;
  String description;
  String portada;

  Mproximamente({
    required this.id,
    required this.title,
    required this.description,
    required this.portada,
  });

  Mproximamente.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        title = res["title"],
        description = res["description"],
        portada = res["portada"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'portada': portada,
    };
  }
}
