
import '../../data/models/getuser_model.dart';
import '../../data/models/posh_model.dart';

abstract class UserRepository {
  Future<List<PostModel>> getUsers(bool conection);
  Future<void> createUser(createModel user);

}