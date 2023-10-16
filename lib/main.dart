import 'package:flutter/material.dart';
import 'package:flutter_application_1/postcase_config.dart';
import 'package:flutter_application_1/publication/presentations/bloc/createpost/createpost_bloc.dart';
import 'package:flutter_application_1/publication/presentations/bloc/getpost/getpost_bloc.dart';
import 'package:flutter_application_1/publication/presentations/pages/getPost_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

UsercaseConfig usercaseConfig = UsercaseConfig();

void main() {
  runApp(
    MultiProvider(
      providers: [
        BlocProvider<CreatePostBloc>(
          create: (context) => CreatePostBloc(
              createUserUseCase: usercaseConfig.createUserUseCase
          ),
        ),


        BlocProvider<GetPostBloc>(
          create: (context) => GetPostBloc(
              getUsersUseCase: usercaseConfig.getUsersUseCase
          ),
        ),



      ],
      child: MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostsPage(),
    );
  }
}







