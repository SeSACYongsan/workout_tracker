import 'package:flutter/material.dart';
import 'package:workout_tracker/models/workout.dart';

class WorkoutItem extends StatelessWidget {
  final int index;
  final Workout workout;
  const WorkoutItem({super.key, required this.index, required this.workout});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/images/${workout.name}.jpeg", width: 70),
        Expanded(
          child: Text(
            "$index. ${workout.koreanName}",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        Text(
          "${workout.duration.toString()}:00",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Colors.blue,
              ),
        ),
      ],
    );
  }
}
