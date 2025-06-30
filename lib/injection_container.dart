import 'package:example/src/core/network/api_client.dart';
import 'package:example/src/features/posts/data/repo_impl/post_repo_impl.dart';
import 'package:example/src/features/posts/data/sources/post_remote_source.dart';
import 'package:example/src/features/posts/domain/repo/posts_repo.dart';
import 'package:example/src/features/posts/domain/usecases/posts_usecase.dart';
import 'package:example/src/features/posts/presentation/blocs/posts_bloc.dart';
import 'package:get_it/get_it.dart';

/// Service Locator
/// We can access it using [sl]
final sl = GetIt.instance;

void initDependencies() {
  _services();
  _sources();
  _repos();
  _usecases();
  _blocs();
}

void _services() {
  sl.registerLazySingleton<ApiClient>(() => ApiClient());
}

void _sources() {
  sl.registerLazySingleton<PostRemoteSource>(() => PostRemoteSource(sl()));
}

void _repos() {
  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(sl()));
}

void _usecases() {
  sl.registerLazySingleton<PostUsecase>(() => PostUsecase(sl()));
}

void _blocs() {
  sl.registerFactory<PostsBloc>(() => PostsBloc(sl()));
}
