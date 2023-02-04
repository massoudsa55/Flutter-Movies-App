import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/services_locator.dart';
import '../../controllers/movie_details/movie_details_bloc.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<MovieDetailsBloc>()..add(GetMovieDetailsEvent(getIt())),
      child: Container(),
    );
  }
}
