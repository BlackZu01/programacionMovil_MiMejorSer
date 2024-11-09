import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/ui/Controller/practiceController.dart';

class WP1 extends StatelessWidget {
  final Practicecontroller controller = Get.find();
  final int  index;

  WP1({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Practicecontroller controller = Get.find();
    return AlertDialog(
      title: Center(
          child: Text(
        "Detalles",
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      )), // Título dinámico
      content: Container(
        width: double.maxFinite,
        constraints: const BoxConstraints(
          maxWidth: 300,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(
                      "Llevas ${controller.getInPractice(index)}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ), // Se actualiza automáticamente
                  ElevatedButton(
                    onPressed: () {
                     controller.incrementInPractice(index);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.inversePrimary),
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Espaciado entre elementos
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.inversePrimary),
              child: const Text("Aceptar"),
            ),
          ],
        ),
      ),
    );
  }
}
