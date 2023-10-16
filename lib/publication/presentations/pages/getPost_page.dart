import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/getpost/getpost_bloc.dart';
import '../bloc/getpost/getpost_event.dart';
import '../bloc/getpost/getpost_state.dart';
import 'createpost_page.dart';
class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => GetPostPage();
}
class GetPostPage extends State<PostsPage> {
  late StreamSubscription<ConnectivityResult> subscription;
  @override
  void initState() {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result == ConnectivityResult.wifi || result == ConnectivityResult.mobile) {
        context.read<GetPostBloc>().add(FetchPostsEvent(conection: true));
        ScaffoldMessenger.of(context ).clearSnackBars();
      } else {
        const snackBar = SnackBar(
          content: Text('Se perdió la conectividad Wi-Fi', style: TextStyle(),),
          duration: Duration(days: 365),
        );
        ScaffoldMessenger.of(context ).showSnackBar(snackBar);
        context.read<GetPostBloc>().add(FetchPostsEvent(conection: false));

      }
    });
  }
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),

      body: BlocBuilder<GetPostBloc, GetPostState>(
        builder: (context, state) {
          if (state is PostsInitial) {
           // BlocProvider.of<GetPostBloc>(context).add(FetchPostsEvent(conection: true));
            return Center(child: CircularProgressIndicator());
          } else if (state is PostsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostsLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {

                        },
                        child: Text('Actualizar'),
                      ),
                      SizedBox(width: 8.0),

                    ],
                  ),
                );
              },
            );
          } else if (state is PostsLoadFailure) {
            return Center(child: Text(state.error));
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePostPage()),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Crear Nuevo Post',
      ),
    );

  }
}
