import '../../domain/entities/post.dart';
class PostModel extends Post {

  PostModel({
    required int id,
    required String description,
    required String multimedia
  }) : super(id: id, description: description, multimedia: multimedia);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      description: json['description'],
      multimedia: json['multimedia'],
    );
  }


  factory PostModel.fromEntity(Post post) {
    return PostModel(
      id: post.id,
      description: post.description,
      multimedia: post.multimedia,
    );
  }

}