import 'package:clean_archicture/core/databases/cache/cache_helper.dart';
import 'package:clean_archicture/core/theme.dart';
import 'package:clean_archicture/features/posts/presentation/bloc/add_delete_update/add_delete_update_bloc.dart';
import 'package:clean_archicture/features/posts/presentation/bloc/post/post_bloc.dart';
import 'package:clean_archicture/features/posts/presentation/pages/post_view.dart';
import 'package:flutter/material.dart';
import 'package:clean_archicture/get_it_injecatuin.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await CacheHelper().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.getIt<PostBloc>()..getAllPost()),
          BlocProvider(create: (_) => di.getIt<AddDeleteUpdateBloc>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'posts',
          theme: appTheme,
          home: const PstView(),
        ));
  }
}
