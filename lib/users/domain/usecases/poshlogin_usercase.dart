

import '../repositories/user_repository.dart';

class LoginUser{
  final UserRepository userRepository;
  LoginUser(this.userRepository);
  Future<LoginUser?> excute(String email, String password)async{
    try{
      await userRepository.postLogin(email, password);
    }catch(e){
      print('error en el login $e');
    }
  }
}