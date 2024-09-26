import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:workout_tracker/firebase_options.dart';
import 'package:workout_tracker/my_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp.router(
      routerConfig: router,
      title: "Workout Tracker",
    ),
  );
}
