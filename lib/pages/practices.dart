import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/PracticesWidgets/W1.dart';
import 'package:my_app/PracticesWidgets/W2.dart';
import 'package:my_app/PracticesWidgets/W3.dart';
import 'package:my_app/PracticesWidgets/W4.dart';
import 'package:my_app/PracticesWidgets/W5.dart';
import 'package:my_app/PracticesWidgets/W6.dart';
import 'package:my_app/PracticesWidgets/W8.dart';


// ignore: use_key_in_widget_constructors
class Practices extends StatelessWidget {

  final List<Map<String, dynamic>> items = [
    {"icon": Icons.water_drop, "text": "Tomar agua"},
    {"icon": Icons.restaurant, "text": "Alimentación sana"},
    {"icon": Icons.directions_run, "text": "Caminar/Trotar"},
    {"icon": Icons.fitness_center, "text": "Gimnasio"},
    {"icon": Icons.library_books, "text": "Estudiar"},
    {"icon": Icons.auto_stories, "text": "Leer"},
    {"icon": Icons.pause_circle, "text": "Pausa activa"},
    {"icon": Icons.hotel, "text": "Tomar una siesta"},
    {"icon": Icons.tv_off, "text": "Tiempo fuera de las pantallas"},
    {"icon": Icons.schedule, "text": "Tiempo libre"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuadrícula de botones'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Selecciona una práctica saludable",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0), 
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ElevatedButton(
                    onPressed: () {
                      switch(index){
                        case 0:Get.off(()=>const Practice1());
                        break;
                        case 1:Get.off(()=>const Practice2());
                        break;
                         case 2:Get.off(()=>const Practice3());
                        break;
                        case 3:Get.off(()=>const Practice4());
                        break;
                         case 4:Get.off(()=>const Practice5());
                        break;
                        case 5:Get.off(()=>const Practice6());
                        break;
                        case 7: Get.off(()=>const Practice8());
                        break;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          items[index]["icon"],
                          size: 70,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          items[index]["text"],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


