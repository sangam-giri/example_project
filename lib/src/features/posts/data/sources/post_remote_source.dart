import 'package:dartz/dartz.dart';
import 'package:example/src/core/network/api_client.dart';
import 'package:example/src/core/network/api_endpoints.dart';
import 'package:example/src/features/posts/data/model/post_model.dart';

class PostRemoteSource {
  const PostRemoteSource(this._apiClient);

  final ApiClient _apiClient;

  fetchPost() async {
    final response = await _apiClient.get(ApiEndpoints.posts);
    response.fold(
      (error) {
        return Left(error);
      },
      (result) {
        final List<PostModel> postModelList =
            (result as List<dynamic>)
                .map((e) => PostModel.fromJson(e))
                .toList();

        return Right(postModelList);
      },
    );
  }
}
