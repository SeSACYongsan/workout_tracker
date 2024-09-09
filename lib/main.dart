import 'package:flutter/material.dart';
import 'package:workout_tracker/my_router.dart';

void main() {
  runApp(
    MaterialApp.router(
      routerConfig: router,
      title: "Workout Tracker",
    ),
  );
}
