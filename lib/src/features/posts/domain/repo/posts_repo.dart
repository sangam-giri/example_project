import 'package:dartz/dartz.dart';
import 'package:example/src/features/posts/data/model/post_model.dart';

abstract class PostRepository {
  Future<Either<String, List<PostModel>>> fetchPosts();
}
