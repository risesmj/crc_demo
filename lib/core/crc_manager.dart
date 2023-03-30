import 'package:crc_demo/entity/polynomial.dart';

class CRCManager {
  int calculate(List<int> bits, Polynomial polynomial) {
    // Inicia o CRC com o valor inicial
    int crc = polynomial.init;

    print("Bits => ${bits.toString()}");
    print("CRC Inicial => ${crc.toRadixString(2)}");
    print("Polinômio => ${polynomial.toString()}");

    for (final bit in bits) {
      //Operação XOR do bit atual com o CRC
      crc = crc ^ bit;

      // Percorre os 8 bits do byte atual
      for (int i = 0; i < 8; i++) {
        // Verifica se o bit menos significativo do CRC é igual a 1
        //Se sim, realiza um shift para a direita e aplica o polinômio,
        //caso contrário realiza apenas um shift para a direita
        crc = ((crc & 1) == 1) ? (crc >> 1) ^ polynomial.poly : crc >> 1;
      }
    }

    print("CRC Final => $crc");

    // Retorna o valor final do CRC
    return crc;
  }

  bool validate(List<int> bits, Polynomial polynomial, int expectedCRC) {
    final actualCRC = calculate(bits, polynomial);
    return actualCRC == expectedCRC;
  }
}
