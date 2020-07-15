// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostsController on _PostsControllerBase, Store {
  final _$postListAtom = Atom(name: '_PostsControllerBase.postList');

  @override
  ObservableList<Post> get postList {
    _$postListAtom.reportRead();
    return super.postList;
  }

  @override
  set postList(ObservableList<Post> value) {
    _$postListAtom.reportWrite(value, super.postList, () {
      super.postList = value;
    });
  }

  final _$commentListAtom = Atom(name: '_PostsControllerBase.commentList');

  @override
  ObservableList<Comment> get commentList {
    _$commentListAtom.reportRead();
    return super.commentList;
  }

  @override
  set commentList(ObservableList<Comment> value) {
    _$commentListAtom.reportWrite(value, super.commentList, () {
      super.commentList = value;
    });
  }

  final _$loadPostsAsyncAction = AsyncAction('_PostsControllerBase.loadPosts');

  @override
  Future loadPosts() {
    return _$loadPostsAsyncAction.run(() => super.loadPosts());
  }

  final _$loadCommentsAsyncAction =
      AsyncAction('_PostsControllerBase.loadComments');

  @override
  Future loadComments({String idPost}) {
    return _$loadCommentsAsyncAction
        .run(() => super.loadComments(idPost: idPost));
  }

  @override
  String toString() {
    return '''
postList: ${postList},
commentList: ${commentList}
    ''';
  }
}
