import 'package:example/src/features/posts/domain/usecases/posts_usecase.dart';
import 'package:example/src/features/posts/presentation/blocs/posts_event.dart';
import 'package:example/src/features/posts/presentation/blocs/posts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc(this._postUsecase) : super(PostsState()) {
    on<FetchPost>(_fetch);
  }

  final PostUsecase _postUsecase;

  void _fetch(FetchPost event, Emitter<PostsState> emit) async {
    emit(state.copyWith(isLoading: true));

    final response = await _postUsecase.fetchPost();
    response.fold(
      (error) {
        emit(state.copyWith(error: error, isLoading: false));
      },
      (result) {
        emit(state.copyWith(postModel: result, isLoading: false));
      },
    );
  }
}
