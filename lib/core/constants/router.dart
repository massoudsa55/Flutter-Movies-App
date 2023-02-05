import 'package:flutter/material.dart';
import 'package:flutter_movies_app/presentation/screens/details/details_screen.dart';

import '../../data/repository/movie_repository.dart';
import '../../data/apis/movie_api.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/landing_screen.dart';
import 'routes.dart';

class AppRouter {
  late MovieRepository movieRepository;

  AppRouter() {
    movieRepository = MovieRepository(MovieApis());
  }

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.landingScreenRoute:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      case AppRoutes.homeScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case AppRoutes.detailsScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const DetailsScreen(movieID: 550),
        );
      default:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
    }
  }
}
