import 'package:flutter_application_1/publication/data/datasources/shared_data_source.dart';
import 'package:flutter_application_1/publication/data/datasources/user_data_source.dart';

import 'package:flutter_application_1/publication/data/repositories/user_repository_impl.dart';

import 'package:flutter_application_1/publication/domain/usecases/getpost_usercase.dart.dart';
import 'package:flutter_application_1/publication/domain/usecases/poshpost_usercase.dart';

class UsercaseConfig {
  UserLocalDataSourceImp? userLocalDataSourceImp;
  Shared_data_sourceImp? shared_data_sourceImp;
  UserRepositoryImpl? userRepositoryImpl;
  GetUsersUseCase? getUsersUseCase;
  CreateUserUseCase? createUserUseCase;


  UsercaseConfig() {
    userLocalDataSourceImp = UserLocalDataSourceImp();
    shared_data_sourceImp = Shared_data_sourceImp();

    userRepositoryImpl = UserRepositoryImpl(userLocalDataSource: userLocalDataSourceImp!, userLocalDataSource2: shared_data_sourceImp!);

    getUsersUseCase = GetUsersUseCase(userRepositoryImpl!);
    createUserUseCase = CreateUserUseCase(userRepositoryImpl!);



  }
}
