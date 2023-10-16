import 'package:flutter_application_1/users/domain/entities/userLogin.dart';
import 'package:flutter_application_1/users/domain/entities/usercreate.dart';

import '../../domain/repositories/user_repository.dart';
import '../datasources/user_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl( {required this.userLocalDataSource});

  @override
  Future<void> createUser(UserCreate user) async {
    await userLocalDataSource.createUser(user);
  }

  @override
  Future<UserLogin?> postLogin(String email, String password) async{
    await userLocalDataSource.postLogin(email, password);
  }


}
