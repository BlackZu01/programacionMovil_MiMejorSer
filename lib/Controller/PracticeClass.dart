


import 'package:get/get.dart';

class Task {
  String name;
  String goal;
  int pts;
  var counter=0.obs;
  bool state;
  var list = <String>[].obs;
  

  Task({required this.name, required this.goal,required this.pts,required this.state});

  String get getname=>name;
  String get getgoal=>goal;
  int get getcount=>counter.value;
  bool get getstate=>state;
  List<String> get getList =>list;


  void addList(List<String> l){
   list.value=l;
  }

}

