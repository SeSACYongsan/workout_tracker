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
          builder: (context, state) => WorkoutListPage(),
          routes: [
            GoRoute(
              path: "workout_guide/:workouts_index",
              builder: (context, state) {
                final workoutsIndexString =
                    state.pathParameters["workouts_index"];
                final workoutsIndex = int.parse(workoutsIndexString!);
                return WorkoutGuidePage(
                  workoutsIndex: workoutsIndex,
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
