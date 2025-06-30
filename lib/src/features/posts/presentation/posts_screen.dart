import 'package:example/injection_container.dart';
import 'package:example/src/features/posts/presentation/blocs/posts_bloc.dart';
import 'package:example/src/features/posts/presentation/blocs/posts_event.dart';
import 'package:example/src/features/posts/presentation/blocs/posts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PostsBloc>()..add(FetchPost()),
      child: Scaffold(
        body: BlocConsumer<PostsBloc, PostsState>(
          listener: (context, state) {
            if (state.error != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('${state.error}')));
            }
          },
          builder: (context, state) {
            if (state.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return Center(child: Text('POST DATA: ${state.postModel}'));
          },
        ),
      ),
    );
  }
}
