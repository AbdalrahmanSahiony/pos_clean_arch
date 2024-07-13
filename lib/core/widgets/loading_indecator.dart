import 'package:flutter/material.dart';

class LoadinIndecator extends StatelessWidget {
  const LoadinIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
