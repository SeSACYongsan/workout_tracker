import 'package:go_router/go_router.dart';
import 'package:workout_tracker/pages/landing_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const LandingPage(),
    ),
  ],
);
