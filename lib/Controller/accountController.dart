
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Accountcontroller extends GetxController{
 var email ="".obs;
  var password="".obs;
  var emailList = <String>[].obs;
  var passwordList = <String>[].obs;

  String get emailValue =>email.value;
  String get passwordValue =>password.value;
  List<String> get emailGetList =>emailList;
  List<String> get passwordGetList =>passwordList;


  void emailpassword(String emailvalue, String passwordValue){
    email.value=emailvalue;
    password.value=passwordValue;
  }


  void reset(){
    email.value="";
    password.value="";
  }
  
  void addEmailList(String value){
    debugPrint(value);
     emailList.add(value);
  }

  void addPasswordList(String value){
     debugPrint(value);
     passwordList.add(value);
  }

   String confirmPassword(int index){
    return passwordList[index];
  }


 

}