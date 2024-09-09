import 'package:flutter/material.dart';
import 'package:workout_tracker/pages/workout_home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      home: WorkoutHomePage(),
    ),
  );
}
