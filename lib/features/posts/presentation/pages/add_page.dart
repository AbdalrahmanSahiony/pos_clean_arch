import 'package:clean_archicture/features/posts/domain/entities/posts.dart';
import 'package:clean_archicture/features/posts/presentation/bloc/add_delete_update/add_delete_update_bloc.dart';
import 'package:clean_archicture/features/posts/presentation/pages/post_view.dart';
import 'package:clean_archicture/features/posts/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Post")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
                controller: BlocProvider.of<AddDeleteUpdateBloc>(context)
                    .bodyController,
                hint: "body"),
            TextFieldWidget(
                controller: BlocProvider.of<AddDeleteUpdateBloc>(context)
                    .titleController,
                hint: "title"),
            ElevatedButton(
              onPressed: () async {
                BlocProvider.of<AddDeleteUpdateBloc>(context).addPost(Post(
                    body: BlocProvider.of<AddDeleteUpdateBloc>(context)
                        .bodyController
                        .text,
                    title: BlocProvider.of<AddDeleteUpdateBloc>(context)
                        .titleController
                        .text));
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (contex) => const PstView()));
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
