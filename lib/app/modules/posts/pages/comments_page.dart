import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:redesocial_flutter/app/modules/posts/posts_controller.dart';

class CommentsPage extends StatefulWidget {
  final String title;
  final String idPost;

  const CommentsPage({Key key, this.title = "Comments", this.idPost}) : super(key: key);

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState
    extends ModularState<CommentsPage, PostsController> {

  final postsController = Modular.get<PostsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (BuildContext context) {

          postsController.loadComments(idPost: (widget.idPost).toString());

          final list = postsController.commentList;
          
          if(list == null) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: list.length,
            padding: EdgeInsets.all(8),
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text(list[index].email),
                    subtitle: Text(list[index].body),
                  ),
                  Divider(),
                ],
              );
            },
          );
        }
      ),
    );
  }
}
