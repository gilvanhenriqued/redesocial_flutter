import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../posts_controller.dart';

class PostsPage extends StatefulWidget {
  final String title;
  const PostsPage({Key key, this.title = "Publicações"}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends ModularState<PostsPage, PostsController> {

  final postsController = Modular.get<PostsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (BuildContext context) {
          final list = postsController.postList;
          
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
                    title: Text(
                      list[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      list[index].body,
                      style: TextStyle(),                      
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    leading: Icon(
                      Icons.account_circle, 
                      color: Colors.blue,
                      size: 40,
                    ),
                    onTap: () {
                      Modular.link.pushNamed('/comments/${list[index].id}');
                    },
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
