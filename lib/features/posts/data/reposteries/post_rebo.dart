import 'package:clean_archicture/core/errors/expentions.dart';
import 'package:clean_archicture/core/errors/failure.dart';
import 'package:clean_archicture/core/network/check_internet.dart';
import 'package:clean_archicture/features/posts/data/data_sources/post_local_data.dart';
import 'package:clean_archicture/features/posts/data/data_sources/post_remote_data.dart';
import 'package:clean_archicture/features/posts/data/models/post_model.dart';
import 'package:clean_archicture/features/posts/domain/entities/posts.dart';
import 'package:clean_archicture/features/posts/domain/repostories/post_repostiers.dart';
import 'package:dartz/dartz.dart';

class PostReboData implements PosrtRepo {
  final PostRemoteDataSource postRemotDataSource;
  final PostLocaDataSourceImpl postLocalDataSource;
  final CheckInternt checkInternt;

  PostReboData(this.checkInternt,
      {required this.postRemotDataSource, required this.postLocalDataSource});
  @override
  Future<Either<Failure, bool>> addPost(Post post) async {
    //  return postEdit(() => postRemotDataSource
    //    .addPost(PostModel(title: post.title, body: post.body)));
    if (await checkInternt.isConnected) {
      try {
        await postRemotDataSource
            .addPost(PostModel(title: post.title, body: post.body));
        return const Right(true);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "No Internet Connecation"));
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) {
    return postEdit(() => postRemotDataSource.deletePost(id));
  }

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await checkInternt.isConnected) {
      try {
        final response = await postRemotDataSource.getAllPost();
        postLocalDataSource.cachePost(response);
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final response = await postLocalDataSource.getCachedPost();
        return Right(response);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) {
    return postEdit(() => postRemotDataSource.updatePost(
        PostModel(id: post.id, title: post.title, body: post.body)));
  }

  Future<Either<Failure, Unit>> postEdit(
      Future<Unit> Function() addOrDeleteOrUpdatePost) async {
    if (await checkInternt.isConnected) {
      try {
        await addOrDeleteOrUpdatePost();
        return Right(Unit as Unit);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "No Internet Connecation"));
    }
  }
}
