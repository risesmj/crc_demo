class CRCManager {
  int calculate(List<bool> bits, int polynomial,
      [int initialValue = 0xFFFFFFFF]) {
    // Inicia o CRC com o valor inicial
    int crc = initialValue;

    // Percorre cada bit da sequência de bits
    for (final bit in bits) {
      // Realiza um XOR bit a bit do bit atual com o CRC
      crc ^= bit ? 1 : 0;

      // Percorre os 8 bits do byte atual
      for (int i = 0; i < 8; i++) {
        // Verifica se o bit menos significativo do CRC é igual a 1
        if ((crc & 1) == 1) {
          // Realiza um shift para a direita e aplica o polinômio
          crc = (crc >> 1) ^ polynomial;
        } else {
          // Realiza apenas um shift para a direita
          crc = crc >> 1;
        }
      }
    }

    // Retorna o valor final do CRC
    return crc;
  }

  bool validate(List<bool> bits, int polynomial, int expectedCRC) {
    final actualCRC = calculate(bits, polynomial);
    return actualCRC == expectedCRC;
  }

  List<bool> stringToBits(String str) {
    final bits = str.codeUnits
        .expand((unit) => unit
            .toRadixString(2)
            .padLeft(8, '0')
            .split('')
            .map((c) => c == '1'))
        .toList();
    return bits;
  }
}
