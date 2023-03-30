List<int> stringToBits(String str) {
  final aux = str.codeUnits
      .expand((unit) =>
          unit.toRadixString(2).padLeft(8, '0').split('').map((c) => c == '1'))
      .toList();

  final bits = <int>[];
  for (bool b in aux) {
    bits.add(b ? 1 : 0);
  }

  return bits;
}
