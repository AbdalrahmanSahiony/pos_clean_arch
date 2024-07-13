import 'package:clean_archicture/core/errors/failure.dart';
import 'package:clean_archicture/features/posts/domain/entities/posts.dart';
import 'package:clean_archicture/features/posts/domain/repostories/post_repostiers.dart';
import 'package:dartz/dartz.dart';

class GetAllPostsUs {
  final PosrtRepo posrtRepo;

  GetAllPostsUs({required this.posrtRepo});
  Future<Either<Failure, List<Post>>> call() async {
    return await posrtRepo.getAllPosts();
  }
}
