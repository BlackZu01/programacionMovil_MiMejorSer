import 'package:flutter/material.dart';

class WP2 extends StatelessWidget {
  final List<String> list;
  final String name;

  const WP2({super.key, required this.list, required this.name});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'Lista',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      content: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.5, // Máximo 50% de la altura de la pantalla
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary, // Color de fondo
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary, // Color del borde
                  ),
                  borderRadius: BorderRadius.circular(8), // Bordes redondeados
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  list[index],
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Cierra el diálogo
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          child: const Text("Aceptar"),
        ),
      ],
    );
  }
}
