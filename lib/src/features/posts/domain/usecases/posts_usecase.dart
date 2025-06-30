import 'package:dartz/dartz.dart';
import 'package:example/src/features/posts/data/model/post_model.dart';
import 'package:example/src/features/posts/domain/repo/posts_repo.dart';

class PostUsecase {
  const PostUsecase(this._postRepository);

  final PostRepository _postRepository;

  Future<Either<String, List<PostModel>>> fetchPost() async {
    return await _postRepository.fetchPosts();
  }
}
