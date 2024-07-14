import 'package:clean_archicture/core/errors/failure.dart';
import 'package:clean_archicture/features/posts/domain/entities/posts.dart';
import 'package:dartz/dartz.dart';

abstract class PosrtRepo {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, Unit>> deletePost(int id);
  Future<Either<Failure, bool>> addPost(Post post);
  Future<Either<Failure, Unit>> updatePost(Post post);
}
