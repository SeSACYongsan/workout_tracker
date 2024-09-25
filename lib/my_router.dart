import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/pages/frame_page.dart';
import 'package:workout_tracker/pages/landing_page.dart';
import 'package:workout_tracker/pages/login_page.dart';
import 'package:workout_tracker/pages/settings_page.dart';
import 'package:workout_tracker/pages/workout_guide_page.dart';
import 'package:workout_tracker/pages/workout_home_page.dart';
import 'package:workout_tracker/pages/workout_list_page.dart';

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const LandingPage(),
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state, navigationShell) {
        return FramePage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeTabNavigatorKey,
          routes: [
            GoRoute(
              path: "/workout_home",
              builder: (context, state) => const WorkoutHomePage(),
              routes: [
                GoRoute(
                  path: "workout_list/:group_index",
                  builder: (context, state) {
                    final groupIndexString =
                        state.pathParameters["group_index"];
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
                        final groupIndexString =
                            state.pathParameters["group_index"];
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
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/settings",
              builder: (context, state) => const SettingsPage(),
              routes: [
                GoRoute(
                  path: "login",
                  builder: (context, state) => const LoginPage(),
                ),
              ],
            ),
          ],
          navigatorKey: _settingsTabNavigatorKey,
        ),
      ],
    ),
  ],
);

final GlobalKey<NavigatorState> _homeTabNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "homeTab");
final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "root");
final GlobalKey<NavigatorState> _settingsTabNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "settingsTab");
