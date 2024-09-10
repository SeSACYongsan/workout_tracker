import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              context.go("/workout_home/workout_list/workout_guide");
            },
            child: WorkoutItem(index: index + 1, workout: workouts[index]),
          ),
          itemCount: workouts.length,
        ),
      ),
    );
  }
}
