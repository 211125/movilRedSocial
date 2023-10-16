import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../domain/entities/userLogin.dart';
import '../../domain/entities/usercreate.dart';
import '../models/post_login.dart';



abstract class UserLocalDataSource {

  Future<void> createUser(UserCreate user);
  Future<UserLogin?> postLogin(String email, String password);

}

class UserLocalDataSourceImp implements UserLocalDataSource {
  final String _baseUrl = 'http://localhost:3000';
  @override
  Future<void> createUser(UserCreate user) async{
    try {
      await http.post(
        Uri.parse('$_baseUrl/user/create'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'name': user.name,
          'last_name': user.last_name,
          'last_name': user.gmail,
          'last_name': user.password,
          'last_name': user.profilePicture,

        }),
      );
    } catch (e) {
      print('Error during network call: $e');
      throw Exception('Network error');
    }

  }

  @override
  Future<UserLogin?> postLogin(String email, String password)async  {
    final response = await http.post(
      Uri.parse('$_baseUrl/login/login'),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Si el servidor devuelve una respuesta OK, parseamos el JSON.
      return UserLoginModel.fromJson(jsonDecode(response.body));
    } else {
      // Si la respuesta no es OK, lanzamos un error.
      print('Response body: ${response.body}');
      throw Exception('Failed to load user');
    }
  }


}