// getpost_event.dart
//import 'package:flutter/cupertino.dart';

//@immutable
abstract class GetPostEvent {}

class FetchPostsEvent extends GetPostEvent {
  final bool conection;
  FetchPostsEvent({required this.conection});
}
