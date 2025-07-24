class MovieIdException implements Exception {
  final String? id;
  MovieIdException({this.id});

  @override
  String toString() =>
      "MovieIdException: movie with id: ${id ?? "Unknow"} not found or malformed!";
}
