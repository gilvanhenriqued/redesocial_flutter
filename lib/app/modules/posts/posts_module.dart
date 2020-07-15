import 'package:dio/dio.dart';
import 'package:redesocial_flutter/app/modules/posts/pages/comments_page.dart';
import 'package:redesocial_flutter/app/shared/constants.dart';
import 'repositories/posts_repository.dart';
import 'posts_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pages/posts_page.dart';

class PostsModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => Dio(BaseOptions(baseUrl: ConstantsAPI.API_URL))),
    Bind((i) => PostsRepository(i.get<Dio>())),
    Bind((i) => PostsController(i.get<PostsRepository>())),
  ];

  @override
  List<Router> get routers => [
    Router('/', child: (_, args) => PostsPage()),
    Router('/comments/:id', 
      child: (_, args) => CommentsPage(idPost: args.params['id'],)),
  ];

  static Inject get to => Inject<PostsModule>.of();
}
