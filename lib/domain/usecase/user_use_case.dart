
import 'package:get/get.dart';
import 'package:my_app/domain/entities/UserClass.dart';
import 'package:my_app/domain/repository/User_repository.dart';


class UserUseCase {
  UserRepository repository = Get.find();

  Future<void> addUser(User user) async => await repository.addUser(user);

  Future<List<User>> getAllUser() async => await repository.getAllUser();

  Future<void> deleteUser(id) async => await repository.deleteUser(id);


  Future<void> updateUser(User user) async => await repository.updateUser(user);
}
