
import 'package:get/get.dart';

class Task {
  int id;
  String name;
  String goal;
  int pts;
  var counter=0.obs;
  var state=false.obs;
  var list = <String>[].obs;
   int goalCounter;
  late List<String> goalList;
  

  Task({required this.id,required this.name, required this.goal,required this.pts, required this.goalCounter});
  
  int get getId=>id;
  String get getname=>name;
  String get getgoal=>goal;
  int get getcount=>counter.value;
  bool get getstate=>state.value;
  List<String> get getList =>list;
  int get getPoints=>pts;
  int get getGoalCounter=>goalCounter;

  void addList(List<String> l){
   list.value=l;
  }

  void goalCounterValue(){
   counter.value++;
  }
  resetCounter()=>counter.value=0;
  falseTask()=>state.value=false;
  trueTask()=>state.value=true;

void addCounterValue(int c){
  counter.value=c;
}
  
}

