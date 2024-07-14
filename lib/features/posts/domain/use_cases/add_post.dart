import 'package:clean_archicture/core/errors/failure.dart';
import 'package:clean_archicture/features/posts/domain/entities/posts.dart';
import 'package:clean_archicture/features/posts/domain/repostories/post_repostiers.dart';
import 'package:dartz/dartz.dart';

class AddPostUs {
  final PosrtRepo posrtRepo;

  AddPostUs({required this.posrtRepo});
  Future<Either<Failure, bool>> call(Post post) async {
    return await posrtRepo.addPost(post);
  }
}
