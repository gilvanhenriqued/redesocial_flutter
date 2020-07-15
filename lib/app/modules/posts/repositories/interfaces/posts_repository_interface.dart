import 'package:redesocial_flutter/app/models/comments_model.dart';
import 'package:redesocial_flutter/app/models/post_model.dart';

abstract class IPostsRepository {
  Future<List<Post>> getAllPosts();
  Future<List<Comment>> getComments(String idPost);
}
