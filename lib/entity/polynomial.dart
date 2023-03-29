class Polynomial {
  final int id;
  final String description;
  final int hex;

  Polynomial({
    required this.id,
    required this.description,
    required this.hex,
  });

  @override
  String toString() {
    return id.toString();
  }
}
