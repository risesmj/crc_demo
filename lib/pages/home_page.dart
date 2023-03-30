import 'package:crc_demo/core/crc_manager.dart';
import 'package:crc_demo/entity/polynomial.dart';
import 'package:crc_demo/pages/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController controller;

  @override
  void initState() {
    super.initState();

    controller = HomeController(
      crc: CRCManager(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CRC")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                minLines: 4,
                maxLines: 10,
                decoration: const InputDecoration(
                  label: Text("Conteúdo da mensagem origem"),
                  border: OutlineInputBorder(),
                ),
                onChanged: controller.onChangeContent,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                minLines: 4,
                maxLines: 10,
                decoration: const InputDecoration(
                  label: Text("Conteúdo da mensagem que chegará ao destino"),
                  border: OutlineInputBorder(),
                ),
                onChanged: controller.onChangeContentDestiny,
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField<Polynomial>(
                decoration: const InputDecoration(
                  label: Text("Polinônio"),
                  border: OutlineInputBorder(),
                ),
                value: controller.currentPolynomialSelected,
                items: controller.listPolynomial
                    .map<DropdownMenuItem<Polynomial>>(
                      (e) => DropdownMenuItem<Polynomial>(
                        value: e,
                        child: Text(e.description),
                      ),
                    )
                    .toList(),
                onChanged: controller.onChangeDropdownPolynomial,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.onPressedButton();
                  setState(() {});
                },
                child: const Text(
                  "Processar",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "CRC calculado na origem: 0x${controller.currentCRCCalculated.toRadixString(16)}",
                style: const TextStyle(fontSize: 18, color: Colors.blue),
              ),
              Text(
                "CRC calculado no destino: 0x${controller.currentCRCCalculatedDestiny.toRadixString(16)}",
                style: const TextStyle(fontSize: 18, color: Colors.green),
              ),
              Text(
                "Status: ${controller.currentStatus}",
                style: TextStyle(
                  fontSize: 18,
                  color: controller.currentStatus == "Válido"
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
