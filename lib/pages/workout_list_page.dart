import 'package:flutter/material.dart';
import 'package:workout_tracker/components/workout_item.dart';
import 'package:workout_tracker/models/workouts.dart';

class WorkoutListPage extends StatelessWidget {
  const WorkoutListPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Workout List"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              for (final workoutItem in workouts.indexed)
                WorkoutItem(index: workoutItem.$1 + 1, workout: workoutItem.$2),
            ],
          ),
        ),
      ),
    );
  }
}
