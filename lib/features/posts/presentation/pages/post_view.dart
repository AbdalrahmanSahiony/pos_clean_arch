import 'package:clean_archicture/core/widgets/loading_indecator.dart';
import 'package:clean_archicture/features/posts/presentation/bloc/post/post_bloc.dart';
import 'package:clean_archicture/features/posts/presentation/pages/add_page.dart';
import 'package:clean_archicture/features/posts/presentation/widgets/error.dart';
import 'package:clean_archicture/features/posts/presentation/widgets/post_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PstView extends StatelessWidget {
  const PstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddPostView()));
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text("Post"),
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            return state.when(
                initial: () => const LoadinIndecator(),
                loadInProgress: () => const LoadinIndecator(),
                loaded: (post) {
                  return PostListView(post: post);
                },
                error: (error) => MessageErrorWidget(
                      message: error,
                    ));
          },
        ));
  }
}
