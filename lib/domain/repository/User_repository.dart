

import 'package:my_app/data/datasource/local.dart/user_local_datasource.dart';
import 'package:my_app/domain/entities/UserClass.dart';


class UserRepository {
  late UserLocalDataSourceHive localDataSource;

  UserRepository() {
    localDataSource = UserLocalDataSourceHive();
  }

  Future<void> addUser(User user) async => await localDataSource.add(user);

  Future<List<User>> getAllUser() async => await localDataSource.getAll();

  Future<void> deleteUser(id) async => await localDataSource.delete(id);


  Future<void> updateUser(User user) async =>
      await localDataSource.updateUser(user);
}