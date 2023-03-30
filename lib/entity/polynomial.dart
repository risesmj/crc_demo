class Polynomial {
  final int id;
  final String description;
  final int poly;
  final int init;

  Polynomial({
    required this.id,
    required this.description,
    required this.poly,
    required this.init,
  });

  @override
  String toString() {
    return poly.toRadixString(16);
  }
}
