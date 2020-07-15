import 'package:mobx/mobx.dart';
import 'package:redesocial_flutter/app/models/comments_model.dart';
import 'package:redesocial_flutter/app/models/post_model.dart';
import 'package:redesocial_flutter/app/modules/posts/repositories/posts_repository.dart';

part 'posts_controller.g.dart';

class PostsController = _PostsControllerBase with _$PostsController;

abstract class _PostsControllerBase with Store {
  final PostsRepository repository;

  @observable
  ObservableList<Post> postList;

  @observable
  ObservableList<Comment> commentList;


  _PostsControllerBase(this.repository) {
    loadPosts();
  }

  @action
  loadPosts() async {
    postList = ObservableList<Post>.of(await repository.getAllPosts());
    //postList = repository.getAllPosts().asObservable();
  }

  @action
  loadComments({String idPost}) async {
    commentList = ObservableList.of(await repository.getComments(idPost));
    // commentList = repository.getComments(idPost).asObservable();
  }

}
