
import '../../domain/entities/userLogin.dart';

class UserLoginModel extends UserLogin {

  UserLoginModel({
    required String gmail,
    required String password,
  }) : super(gmail: gmail, password: password);


  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
      gmail: json['email'] ?? '',
      password: json['password'] ?? '',

    );
  }

  factory UserLoginModel.fromEntity(UserLogin login) {
    return UserLoginModel(
      gmail: login.gmail,
      password: login.password,
    );
  }
}
