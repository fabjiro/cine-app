class Mtandas {
  String id;
  String title;
  String description;
  String portada;
  String trailer;
  bool estreno;

  Mtandas({
    required this.id,
    required this.title,
    required this.description,
    required this.portada,
    required this.estreno,
    required this.trailer,
  });

  Mtandas.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        title = res["title"],
        description = res["description"],
        portada = res["portada"],
        estreno = res['estreno'],
        trailer = res['trailer'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'portada': portada,
      'estreno': estreno,
      'trailer': trailer,
    };
  }
}
