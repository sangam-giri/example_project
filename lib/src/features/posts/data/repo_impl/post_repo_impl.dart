import 'package:dartz/dartz.dart';
import 'package:example/src/features/posts/data/model/post_model.dart';
import 'package:example/src/features/posts/data/sources/post_remote_source.dart';
import 'package:example/src/features/posts/domain/repo/posts_repo.dart';

class PostRepositoryImpl implements PostRepository {
  const PostRepositoryImpl(this._postRemoteSource);

  final PostRemoteSource _postRemoteSource;

  @override
  Future<Either<String, List<PostModel>>> fetchPosts() async {
    return await _postRemoteSource.fetchPost();
  }
}
