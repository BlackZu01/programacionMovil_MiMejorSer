
import 'package:my_app/ui/Controller/PracticeClass.dart';

class Goal{
  int id;
  late int goal;
 late List<String> list;

  Goal({required this.id});

  
}

class User{
  String name;
  String email;
  String password;
  int pts;
 late List<Task> tasks=[]; 
  late List <Goal>goals;
  User({required this.name, required this.email,required  this.password,required this.pts});

  String get getname=>name;
  String get getemail=>email;
  String get getPassword=>password;
  int get getPoints=>pts;
  List<Task> get getTask=>tasks;
   List<Goal> get getGoal=>goals;

  void addList(List<Task> list){
   tasks.addAll(list);
  }
}