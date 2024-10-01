


import 'package:get/get.dart';

class Task {
  String name;
  String goal;
  int pts;
  var counter=0.obs;
  var state=false.obs;
  var list = <String>[].obs;
  

  Task({required this.name, required this.goal,required this.pts});

  String get getname=>name;
  String get getgoal=>goal;
  int get getcount=>counter.value;
  bool get getstate=>state.value;
  List<String> get getList =>list;
  int get getPoints=>pts;

  void addList(List<String> l){
   list.value=l;
  }


  resetCounter()=>counter.value=0;
  falseTask()=>state.value=false;
  trueTask()=>state.value=true;
}

