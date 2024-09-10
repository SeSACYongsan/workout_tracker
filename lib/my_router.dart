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
          path: "workout_list/:group_index",
          builder: (context, state) {
            final groupIndexString = state.pathParameters["group_index"];
            final groupIndex = int.parse(groupIndexString!);
            return WorkoutListPage(
              groupIndex: groupIndex,
            );
          },
          routes: [
            GoRoute(
              path: "workout_guide/:workouts_index",
              builder: (context, state) {
                final workoutsIndexString =
                    state.pathParameters["workouts_index"];
                final workoutsIndex = int.parse(workoutsIndexString!);
                final groupIndexString = state.pathParameters["group_index"];
                final groupIndex = int.parse(groupIndexString!);
                return WorkoutGuidePage(
                  workoutsIndex: workoutsIndex,
                  groupIndex: groupIndex,
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
