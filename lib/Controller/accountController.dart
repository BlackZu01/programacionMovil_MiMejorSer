

import 'package:get/get.dart';

class Accountcontroller extends GetxController{
 var email ="".obs;
  var password="".obs;
  var name="Julian".obs;
  var emailList = <String>[].obs;
  var passwordList = <String>[].obs;
    var nameList = <String>[].obs;

  String get emailValue =>email.value;
  String get passwordValue =>password.value;
  String get nameValue =>name.value;
  List<String> get emailGetList =>emailList;
  List<String> get passwordGetList =>passwordList;
  List<String> get nameGetList =>nameList;


  void emailpassword(String emailvalue, String passwordValue){
    email.value=emailvalue;
    password.value=passwordValue;
  }

  void changename(String namevalue){
    name.value=namevalue;
  }


  void reset(){
    email.value="";
    password.value="";
  }
  
  void addEmailList(String value){
     emailList.add(value);
  }

   void addnameList(String value){
     nameList.add(value);
  }

  void addPasswordList(String value){
     passwordList.add(value);
  }

   String confirmPassword(int index){
    return passwordList[index];
  }

  String obtainName(int index){
    return nameList[index];
  }


 

}