import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies_app/core/utils/enums.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/services/api_services.dart';
import '../../../core/utils/dummy.dart';
import '../../controllers/bloc/movie_bloc.dart';
import '../../controllers/bloc/movie_state.dart';
import 'movie_item.dart';

class PopularMovieWidget extends StatelessWidget {
  const PopularMovieWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
          previous.popularRequestState != current.popularRequestState,
      builder: (context, state) {
        switch (state.popularRequestState) {
          case RequestState.loading:
            return const SizedBox(
                height: 170, child: Center(child: CircularProgressIndicator()));
          case RequestState.laoded:
            return MovieItem(
              movie: state.popularListMovies,
              onTap: () {},
            );
          case RequestState.error:
            return Text(state.nowPlayingMessage);
        }
      },
    );
  }
}
