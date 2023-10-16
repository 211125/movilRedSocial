

import '../entities/userLogin.dart';
import '../entities/usercreate.dart';

abstract class UserRepository{
  Future<void> createUser(UserCreate user);
  Future<UserLogin?> postLogin(String email, String password);

}