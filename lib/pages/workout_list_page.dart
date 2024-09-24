import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/components/workout_item.dart';
import 'package:workout_tracker/models/workout.dart';
import 'package:workout_tracker/models/workout_manager.dart';

class WorkoutListPage extends StatelessWidget {
  final int groupIndex;
  WorkoutListPage({super.key, required this.groupIndex}) {
    WorkoutManager.currentWorkoutGroupIndex = groupIndex;
    WorkoutManager.increaseMonthlyWorkoutCount();
  }
  @override
  Widget build(BuildContext context) {
    final List<Workout> workouts =
        WorkoutManager.workoutGroups[groupIndex].workouts;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Workout List"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go("/workout_home");
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              context.go(
                  "/workout_home/workout_list/$groupIndex/workout_guide/$index");
            },
            child: WorkoutItem(index: index + 1, workout: workouts[index]),
          ),
          itemCount: workouts.length,
        ),
      ),
    );
  }
}
