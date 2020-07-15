import 'package:dio/dio.dart';
import 'package:redesocial_flutter/app/models/comments_model.dart';
import 'package:redesocial_flutter/app/models/post_model.dart';
import 'interfaces/posts_repository_interface.dart';

class PostsRepository implements IPostsRepository {

  final Dio dio;

  PostsRepository(this.dio); 

  @override
  Future<List<Post>> getAllPosts() async {
    final res = await dio.get('/posts');
    
    List<Post> postList = List();

    if(res.statusCode == 200) {
      res.data.forEach((item) => postList.add(Post.fromJSON(item)));

      return postList;

    } else {
      print('Erro no carregamento da lista' + res.statusCode.toString());
      return null;
    }

  }

  @override
  Future<List<Comment>> getComments(String idPost) async {
    final res = await dio.get('/comments?postId=' + idPost);
    
    List<Comment> commentList = List();

    if(res.statusCode == 200) {
      res.data.forEach((item) => commentList.add(Comment.fromJSON(item)));
      
      return commentList;

    } else {
      print('Erro no carregamento da lista' + res.statusCode.toString());
      return null;
    }
  }

}