import 'package:flutter/material.dart';

import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/landing_screen.dart';
import 'routes.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.landingScreenRoute:
      return MaterialPageRoute(builder: (_) => const LandingScreen());
    case AppRoutes.homeScreenRoute:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    default:
      return MaterialPageRoute(builder: (_) => const LandingScreen());
  }
}
