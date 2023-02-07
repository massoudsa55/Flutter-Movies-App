import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utils/app_string.dart';
import '../../controllers/movie/movie_bloc.dart';
import '../../widgets/home/header_and_see_more_movies.dart';
import '../../widgets/home/now_playing_movie_widget.dart';
import '../../widgets/home/popular_movie_widget.dart';
import '../../widgets/home/top_rated_movie_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieBloc>()
        ..add(GetNowPlayingMovieEvent())
        ..add(GetPopularMovieEvent())
        ..add(GetTopRatedMovieEvent()),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            key: const Key('movieScrollView'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NowPlayingMovieWidget(),
                HeaderAndSeeMoreMovies(
                    title: AppString.popular, onTapSeeMore: () {}),
                const PopularMovieWidget(),
                HeaderAndSeeMoreMovies(
                    title: AppString.topRated, onTapSeeMore: () {}),
                const TopRatedMovieWidget(),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
