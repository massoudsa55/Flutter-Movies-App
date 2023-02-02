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
      create: (context) => MovieBloc(getIt())..add(GetNowPlayingMovieEvant()),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                key: const Key('movieScrollView'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 400.0,
                          viewportFraction: 1.0,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          // autoPlayCurve: Curves.linearToEaseOut,
                          autoPlayCurve: Curves.slowMiddle,
                          onPageChanged: (index, reason) {},
                        ),
                        items: moviesList.map(
                          (item) {
                            return GestureDetector(
                              key: const Key('openMovieMinimalDetail'),
                              onTap: () {
                                /// TODO : NAVIGATE TO MOVIE DETAILS
                              },
                              child: Stack(
                                children: [
                                  ShaderMask(
                                    shaderCallback: (rect) {
                                      return const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          // fromLTRB
                                          Colors.transparent,
                                          Colors.black,
                                          Colors.black,
                                          Colors.transparent,
                                        ],
                                        stops: [0, 0.3, 0.5, 1],
                                      ).createShader(
                                        Rect.fromLTRB(
                                            0, 0, rect.width, rect.height),
                                      );
                                    },
                                    blendMode: BlendMode.dstIn,
                                    child: CachedNetworkImage(
                                      height: 560.0,
                                      imageUrl: ApiServices.imageUrl(
                                          item.backdropPath),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 16.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.circle,
                                                color: Colors.redAccent,
                                                size: 12.0,
                                              ),
                                              const SizedBox(width: 4.0),
                                              Text(
                                                'Now Playing'.toUpperCase(),
                                                style: const TextStyle(
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 16.0),
                                          child: Text(
                                            item.title,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    // header popular
                    Container(
                      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular",
                            style: GoogleFonts.poppins(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.15,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              /// TODO : NAVIGATION TO POPULAR SCREEN
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: const [
                                  Text('See More'),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: SizedBox(
                        height: 170.0,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          itemCount: moviesList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: InkWell(
                                onTap: () {
                                  /// TODO : NAVIGATE TO  MOVIE DETAILS
                                },
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                  child: CachedNetworkImage(
                                    width: 120.0,
                                    fit: BoxFit.cover,
                                    imageUrl: ApiServices.imageUrl(
                                        moviesList[index].backdropPath),
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                      baseColor: Colors.grey[850]!,
                                      highlightColor: Colors.grey[800]!,
                                      child: Container(
                                        height: 170.0,
                                        width: 120.0,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    // header top rated
                    Container(
                      margin: const EdgeInsets.fromLTRB(
                        16.0,
                        24.0,
                        16.0,
                        8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top Rated",
                            style: GoogleFonts.poppins(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.15,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              /// TODO : NAVIGATION TO Top Rated Movies Screen
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: const [
                                  Text('See More'),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: SizedBox(
                        height: 170.0,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          itemCount: moviesList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: InkWell(
                                onTap: () {
                                  /// TODO : NAVIGATE TO  MOVIE DETAILS
                                },
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                  child: CachedNetworkImage(
                                    width: 120.0,
                                    fit: BoxFit.cover,
                                    imageUrl: ApiServices.imageUrl(
                                        moviesList[index].backdropPath),
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                      baseColor: Colors.grey[850]!,
                                      highlightColor: Colors.grey[800]!,
                                      child: Container(
                                        height: 170.0,
                                        width: 120.0,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 50.0),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
