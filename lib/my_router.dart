import 'package:go_router/go_router.dart';
import 'package:workout_tracker/pages/landing_page.dart';
import 'package:workout_tracker/pages/workout_guide_page.dart';
import 'package:workout_tracker/pages/workout_home_page.dart';
import 'package:workout_tracker/pages/workout_list_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      path: "/workout_home",
      builder: (context, state) => const WorkoutHomePage(),
      routes: [
        GoRoute(
          path: "workout_list",
          builder: (context, state) => const WorkoutListPage(),
          routes: [
            GoRoute(
              path: "workout_guide",
              builder: (context, state) => const WorkoutGuidePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
