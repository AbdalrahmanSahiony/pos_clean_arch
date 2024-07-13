import 'package:clean_archicture/core/errors/failure.dart';
import 'package:clean_archicture/features/posts/domain/repostories/post_repostiers.dart';
import 'package:dartz/dartz.dart';

class DeletePostUs {
  final PosrtRepo posrtRepo;

  DeletePostUs({required this.posrtRepo});
  Future<Either<Failure, void>> call(int id) async {
    return await posrtRepo.deletePost(id);
  }
}
