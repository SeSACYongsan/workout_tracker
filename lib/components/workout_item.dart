import 'package:flutter/material.dart';
import 'package:workout_tracker/models/workout.dart';

class WorkoutItem extends StatelessWidget {
  final int index;
  final Workout workout;
  const WorkoutItem({super.key, required this.index, required this.workout});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Image.asset(
          "assets/images/${workout.name}.jpeg",
        ),
        title: Text(
          "$index. ${workout.koreanName}",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        trailing: Text(
          "${workout.duration.toString()}:00",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.blue,
              ),
        ),
      ),
    );
  }
}
