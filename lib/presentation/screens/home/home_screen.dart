import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies_app/data/apis/movie_api.dart';
import 'package:flutter_movies_app/domain/usecases/get_now_playing_movie_usecase.dart';

import '../../../business_logic/cubit/movies_cubit.dart';
import '../../../core/constants/colors.dart';
import '../../../data/models/movie_model.dart';
import '../../../data/repository/movie_repository.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/repository/base_movies_repository.dart';
import '../../widgets/home/movie_item.dart';

class HomeScreen extends StatefulWidget {
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
}
