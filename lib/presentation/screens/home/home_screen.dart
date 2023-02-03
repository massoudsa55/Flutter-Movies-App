import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies_app/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/services/api_services.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/dummy.dart';
import '../../controllers/bloc/movie_bloc.dart';
import '../../controllers/bloc/movie_state.dart';
import '../../widgets/home/header_and_see_more_movies.dart';
import '../../widgets/home/now_playing_movie_widget.dart';
import '../../widgets/home/popular_movie_widget.dart';
import '../../widgets/home/top_rated_movie_widget.dart';

/*class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // for all movies
  List<Movie> allMovies = [];

  @override
  void initState() {
    super.initState();
    // inject the state for getting all movies
    // allMovies = BlocProvider.of<MoviesCubit>(context).getNowPlayingMovies();
    _getMovieData();
  }

  Widget buildBlocWidget() => BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          //if (state is MoviesLoaded) {
          if (allMovies.isNotEmpty) {
            return buildLoadedListWidgets();
          }
          return showLoadingIndicator();
        },
      );

  Widget buildLoadedListWidgets() => SingleChildScrollView(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: allMovies.length,
          itemBuilder: (context, index) => MovieItem(movie: allMovies[index]),
        ),
      );

  Widget showLoadingIndicator() =>
      const Center(child: CircularProgressIndicator(color: kPrimaryColor));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          /*appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(color: kPrimaryColor),
                child: Material(
                  borderRadius: BorderRadius.circular(7),
                  elevation: 1,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        borderSide: BorderSide(
                          color: Colors.black38,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),*/
          body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(color: kTertiaryColor),
              child: Center(
                child: Text(
                    allMovies.isNotEmpty ? allMovies[0].title : "Data empty"),
              ),
            ),
            const SizedBox(height: 20),
            buildBlocWidget(),
          ],
        ),
      )),
    );
  }

  void _getMovieData() async {
    BaseMovieApis movieApis = MovieApis();
    BaseMoviesRepository moviesRepository = MovieRepository(movieApis);
    final resutl = await GetNowPlayingMovieUseCase(moviesRepository).run();
    resutl.fold((l) => null, (list) => allMovies = list);
    print("ddd = ${allMovies[0].title}");
  }
}*/

/// -------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieBloc>()
        ..add(GetNowPlayingMovieEvant())
        ..add(GetPopularMovieEvant())
        ..add(GetTopRatedMovieEvant()),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            key: const Key('movieScrollView'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NowPlayingMovieWidget(),
                HeaderAndSeeMoreMovies(title: "Popular", onTapSeeMore: () {}),
                const PopularMovieWidget(),
                HeaderAndSeeMoreMovies(title: "Top Rated", onTapSeeMore: () {}),
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
