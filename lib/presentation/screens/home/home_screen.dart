import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubit/movies_cubit.dart';
import '../../../data/models/movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // for all movies
  late List<Movie> allMvies;

  @override
  void initState() {
    super.initState();
    // inject the state has all movies
    allMvies = BlocProvider.of<MoviesCubit>(context).getAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
