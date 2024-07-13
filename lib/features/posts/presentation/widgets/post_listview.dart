import 'package:clean_archicture/features/posts/domain/entities/posts.dart';
import 'package:flutter/material.dart';

class PostListView extends StatelessWidget {
  final List<Post> post;
  const PostListView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView.separated(
          itemBuilder: ((context, index) => ListTile(
                leading: Text(post[index].id.toString()),
                title: Text(
                  post[index].title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(post[index].body),
              )),
          separatorBuilder: (context, index) => Divider(
                thickness: 1,
              ),
          itemCount: post.length),
    );
  }
}
