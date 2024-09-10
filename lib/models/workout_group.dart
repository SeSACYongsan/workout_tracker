import 'package:workout_tracker/models/workout.dart';

class WorkoutGroup {
  final String groupDescription;
  List<Workout> workouts;
  WorkoutGroup({required this.groupDescription, required this.workouts});
}
