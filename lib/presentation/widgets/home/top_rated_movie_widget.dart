import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies_app/core/utils/enums.dart';

import '../../controllers/movie/movie_bloc.dart';
import '../../controllers/movie/movie_state.dart';
import 'movie_item.dart';

class TopRatedMovieWidget extends StatelessWidget {
  const TopRatedMovieWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
          previous.topRatedRequestState != current.topRatedRequestState,
      builder: (context, state) {
        switch (state.topRatedRequestState) {
          case RequestState.loading:
            return const SizedBox(
              height: 170.0,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.laoded:
            return MovieItem(
              movie: state.topRatedListMovies,
              onTap: () {},
            );
          case RequestState.error:
            return Text(state.topRatedMessage);
        }
      },
    );
  }
}
