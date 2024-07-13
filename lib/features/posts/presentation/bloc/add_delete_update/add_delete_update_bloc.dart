import 'package:clean_archicture/features/posts/domain/entities/posts.dart';
import 'package:clean_archicture/features/posts/domain/use_cases/add_post.dart';
import 'package:clean_archicture/features/posts/domain/use_cases/delete_post.dart';
import 'package:clean_archicture/features/posts/domain/use_cases/update_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_delete_update_state.dart';
part 'add_delete_update_bloc.freezed.dart';

class AddDeleteUpdateBloc extends Cubit<AddDeleteUpdateState> {
  AddPostUs addPostUs;
  DeletePostUs deletePostUs;
  UpdatePostUs updatePostUs;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  AddDeleteUpdateBloc(
      {required this.addPostUs,
      required this.deletePostUs,
      required this.updatePostUs})
      : super(const AddDeleteUpdateState.initial());
  addPost(Post post) async {
    emit(const AddDeleteUpdateState.loadInProgress());
    final response = await addPostUs.call(post);
    response.fold(
        (failure) => emit(AddDeleteUpdateState.error(failure.errMessage)),
        (post) => emit(const AddDeleteUpdateState.done()));
  }

  deletePost(int id) async {
    emit(const AddDeleteUpdateState.loadInProgress());
    final response = await deletePostUs.call(id);
    response.fold(
        (failure) => emit(AddDeleteUpdateState.error(failure.errMessage)),
        (post) => emit(const AddDeleteUpdateState.done()));
  }

  updatePost(Post post) async {
    emit(const AddDeleteUpdateState.loadInProgress());
    final response = await updatePostUs.call(post);
    response.fold(
        (failure) => emit(AddDeleteUpdateState.error(failure.errMessage)),
        (post) => emit(const AddDeleteUpdateState.done()));
  }
}
