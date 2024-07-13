import 'package:clean_archicture/core/databases/api/api_consumer.dart';
import 'package:clean_archicture/core/databases/api/dio_consumer.dart';
import 'package:clean_archicture/core/databases/cache/cache_helper.dart';
import 'package:clean_archicture/core/network/check_internet.dart';
import 'package:clean_archicture/features/posts/data/data_sources/post_local_data.dart';
import 'package:clean_archicture/features/posts/data/data_sources/post_remote_data.dart';
import 'package:clean_archicture/features/posts/data/reposteries/post_rebo.dart';
import 'package:clean_archicture/features/posts/domain/repostories/post_repostiers.dart';
import 'package:clean_archicture/features/posts/domain/use_cases/add_post.dart';
import 'package:clean_archicture/features/posts/domain/use_cases/delete_post.dart';
import 'package:clean_archicture/features/posts/domain/use_cases/get_posts.dart';
import 'package:clean_archicture/features/posts/domain/use_cases/update_post.dart';
import 'package:clean_archicture/features/posts/presentation/bloc/add_delete_update/add_delete_update_bloc.dart';
import 'package:clean_archicture/features/posts/presentation/bloc/post/post_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final getIt = GetIt.instance;
init() {
//!post feature
//Bloc
  getIt.registerFactory(() => PostBloc(getIt()));
  getIt.registerFactory(() => AddDeleteUpdateBloc(
      addPostUs: getIt(), deletePostUs: getIt(), updatePostUs: getIt()));
//usecases
  getIt.registerLazySingleton(() => GetAllPostsUs(posrtRepo: getIt()));
  getIt.registerLazySingleton(() => AddPostUs(posrtRepo: getIt()));
  getIt.registerLazySingleton(() => DeletePostUs(posrtRepo: getIt()));
  getIt.registerLazySingleton(() => UpdatePostUs(posrtRepo: getIt()));
  //repo
  getIt.registerLazySingleton<PosrtRepo>(() => PostReboData(getIt(),
      postRemotDataSource: getIt(), postLocalDataSource: getIt()));
  //data source
  getIt.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(api: getIt()));
  getIt.registerLazySingleton(
      () => PostLocaDataSourceImpl(cacheHelper: getIt()));
//!core
  getIt.registerLazySingleton<CheckInternt>(
      () => CheckInternetImpl(internetConnectionChecker: getIt()));
//!external
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt()));
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => CacheHelper());
}
