import 'package:flutter/material.dart';
import 'core/constants/router.dart';
import 'core/constants/routes.dart';
import 'core/services/services_locator.dart';

void main() {
  ServicesLocator().init();
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        backgroundColor: Colors.grey.shade900,
      ),
      onGenerateRoute: appRouter.onGenerateRoute,
      initialRoute: AppRoutes.homeScreenRoute,
    );
  }
}
