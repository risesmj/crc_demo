import 'package:crc_demo/core/crc_manager.dart';
import 'package:crc_demo/core/util.dart';
import 'package:crc_demo/entity/polynomial.dart';

class HomeController {
  late Polynomial currentPolynomialSelected;
  final CRCManager crc;

  //conteúdo origem
  var currentContent = "";
  var currentCRCCalculated = 0;

  //conteúdo destino
  var currentContentDestiny = "";
  var currentCRCCalculatedDestiny = 0;

  //status
  var currentStatus = "";

  //Polinomios para calculo
  var listPolynomial = <Polynomial>[
    Polynomial(
      id: 16,
      poly: 0x1021,
      description: "CRC-16",
      init: 0x1D0F,
    ),
    Polynomial(
      id: 32,
      poly: 0x04C11DB7,
      description: "CRC-32",
      init: 0xFFFFFFFF,
    ),
  ];

  HomeController({
    required this.crc,
  }) {
    currentPolynomialSelected = listPolynomial[0];
  }

  onChangeContent(value) {
    currentContent = value;
  }

  onChangeContentDestiny(value) {
    currentContentDestiny = value;
  }

  onChangeDropdownPolynomial(value) {
    currentPolynomialSelected = value;
  }

  onPressedButton() {
    //Calcula origem
    final bits = stringToBits(currentContent);
    currentCRCCalculated = crc.calculate(bits, currentPolynomialSelected);

    //Calcula destino
    final bitsDestiny = stringToBits(currentContentDestiny);
    currentCRCCalculatedDestiny =
        crc.calculate(bitsDestiny, currentPolynomialSelected);

    //Valida o CRC de acordo com a mensagem que chegou no destino, com o CRC da origem
    currentStatus = (crc.validate(
            bitsDestiny, currentPolynomialSelected, currentCRCCalculated))
        ? "Válido"
        : "Inválido";
  }
}
