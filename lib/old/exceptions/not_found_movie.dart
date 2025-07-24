class NotFoundMovie implements Exception {
  final String message;

  NotFoundMovie(this.message);

  @override
  String toString() => 'NotFoundMovie: $message';
}
