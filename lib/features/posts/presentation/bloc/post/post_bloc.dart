import 'package:clean_archicture/features/posts/domain/entities/posts.dart';
import 'package:clean_archicture/features/posts/domain/use_cases/get_posts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_state.dart';
part 'post_bloc.freezed.dart';

class PostBloc extends Cubit<PostState> {
  final GetAllPostsUs getAllPostsUs;
  PostBloc(this.getAllPostsUs) : super(const PostState.initial());
  getAllPost() async {
    emit(const PostState.loadInProgress());
    final response = await getAllPostsUs.call();
    response.fold((failure) => emit(PostState.error(failure.errMessage)),
        (post) => emit(PostState.loaded(post)));
  }
}
