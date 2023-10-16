import '../../domain/entities/post.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_data_source.dart';
import '../models/getuser_model.dart';
import '../models/posh_model.dart';
import '../datasources/shared_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource userLocalDataSource;
  final UserLocalDataSource2 userLocalDataSource2;

  UserRepositoryImpl( {required this.userLocalDataSource,required this.userLocalDataSource2,});

  @override
  Future<List<PostModel>> getUsers(bool conection) async {
    if(conection){
      return await userLocalDataSource.getUsers(conection);

    }else{
      return await userLocalDataSource2.getUsers(conection);
    }
  }



  @override
  Future<void> createUser(createModel user) async {
    await userLocalDataSource.createUser(user);
  }


}
