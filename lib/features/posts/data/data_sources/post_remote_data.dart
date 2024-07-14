import 'dart:async';

import 'package:clean_archicture/core/databases/api/api_consumer.dart';
import 'package:clean_archicture/core/databases/api/end_points.dart';
import 'package:clean_archicture/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPost();
  Future<Unit> deletePost(int id);
  Future<bool> addPost(PostModel postModel);
  Future<Unit> updatePost(PostModel postModel);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final ApiConsumer api;

  PostRemoteDataSourceImpl({required this.api});
  @override
  Future<bool> addPost(PostModel postModel) {
    api.post(EndPoints.baserUrl,
        data: {"title": postModel.title, "body": postModel.body});
    return Future.value(true);
  }

  @override
  deletePost(int id) {
    api.delete(EndPoints.baserUrl, data: {"id": id.toString()});
    return Future.value(Unit as FutureOr<Unit>?);
  }

  @override
  Future<List<PostModel>> getAllPost() async {
    List response = await api.get(EndPoints.baserUrl);
    List<PostModel> postMode = [];
    postMode.addAll(response.map((e) => PostModel.fromJson(e)));
    return (postMode);
  }

  @override
  Future<Unit> updatePost(PostModel postModel) {
    api.patch(EndPoints.baserUrl + postModel.id.toString(), data: {
      "title": postModel.title,
      "body": postModel.body,
    });
    return Future.value(Unit as FutureOr<Unit>?);
  }
}
