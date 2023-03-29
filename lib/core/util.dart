List<bool> stringToBits(String str) {
  final bits = str.codeUnits
      .expand((unit) =>
          unit.toRadixString(2).padLeft(8, '0').split('').map((c) => c == '1'))
      .toList();
  return bits;
}
