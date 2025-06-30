import 'package:example/src/features/posts/data/model/post_model.dart';

class PostsState {
  const PostsState({this.isLoading = true, this.postModel, this.error});

  final bool isLoading;
  final List<PostModel>? postModel;
  final String? error;

  PostsState copyWith({
    bool? isLoading,
    List<PostModel>? postModel,
    String? error,
  }) {
    return PostsState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      postModel: postModel ?? this.postModel,
    );
  }
}
