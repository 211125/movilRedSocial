import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/getuser_model.dart';

import 'package:http/http.dart' as http;

import '../models/posh_model.dart';



abstract class UserLocalDataSource {
  Future<List<PostModel>> getUsers(bool conection);
  Future<void> createUser(createModel user);


}

class UserLocalDataSourceImp implements UserLocalDataSource {
  final String _baseUrl = 'http://localhost:3000';
@override
Future<List<PostModel>> getUsers(bool conection) async {
    var response = await http.get(Uri.parse('$_baseUrl/publication/public'));
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (response.statusCode == 200) {
        List<PostModel> posts=jsonDecode(response.body).map<PostModel>((post)=>PostModel.fromJson(post)).toList();

        // Antes de guardar
        print("Guardando en SharedPreferences: ${response.body}");

        sharedPreferences.setString('posts', jsonEncode(response.body));

        return posts;
    } else {
        throw Exception('Failed to load users');
    }
}


  @override
  Future<void> createUser(createModel user) async {
    try {
      await http.post(
        Uri.parse('$_baseUrl/publication/public'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'title': user.title,
          'post': user.post,
        }),
      );
    } catch (e) {
      print('Error during network call: $e');
      throw Exception('Network error');
    }

  }




}