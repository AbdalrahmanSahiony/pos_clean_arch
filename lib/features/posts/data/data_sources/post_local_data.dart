// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:clean_archicture/core/errors/expentions.dart';

import 'package:clean_archicture/core/databases/cache/cache_helper.dart';
import 'package:clean_archicture/features/posts/data/models/post_model.dart';

class PostLocaDataSourceImpl {
  CacheHelper cacheHelper;
  PostLocaDataSourceImpl({
    required this.cacheHelper,
  });
  cachePost(List<PostModel> post) {
    List postModelsToJson = post
        .map<Map<String, dynamic>>((postModel) => postModel.toJson())
        .toList();

    cacheHelper.saveData(key: "cach", value: json.encode(postModelsToJson));
  }

  Future<List<PostModel>> getCachedPost() {
    final jsonString = cacheHelper.getData(key: "cach");
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<PostModel> jsonToPostModels = decodeJsonData
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModels);
    } else {
      throw CacheExeption(errorMessage: "No Data");
    }
  }
}
