import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:workout_tracker/models/workout.dart';
import 'package:workout_tracker/models/workout_manager.dart';

class WorkoutGuidePage extends StatefulWidget {
  final int workoutsIndex;
  final int groupIndex;
  const WorkoutGuidePage({
    super.key,
    required this.workoutsIndex,
    required this.groupIndex,
  });
  @override
  State<WorkoutGuidePage> createState() => _WorkoutGuidePageState();
}

class _WorkoutGuidePageState extends State<WorkoutGuidePage>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> animation;
  late AnimationController animationController;
  late Workout currentWorkout;
  late List<Workout> workouts;
  final audioPlayer = AudioPlayer();
  int workoutsIndex = 0;
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Workout Guide"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentWorkout.name,
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      await audioPlayer.stop();
                      setState(() {
                        prevWorkout();
                      });
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 50,
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                        "assets/images/${currentWorkout.imageName}"),
                  ),
                  IconButton(
                    onPressed: () async {
                      await audioPlayer.stop();
                      setState(() {
                        nextWorkout();
                      });
                    },
                    icon: const Icon(
                      Icons.chevron_right,
                      size: 50,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                textAlign: TextAlign.center,
                "${currentWorkout.minutes}분",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Colors.blue,
                    ),
              ),
              const SizedBox(height: 30),
              getIconButton()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    animationController.dispose();
    super.dispose();
  }

  Widget getIconButton() {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return IconButton(
          onPressed: handleIconPressed,
          icon: Icon(
            isPlaying ? Icons.stop_circle : Icons.play_circle_fill,
            size: 70,
            color: animation.value,
          ),
        );
      },
    );
  }

  Future<void> handleIconPressed() async {
    if (isPlaying) {
      await audioPlayer.stop();
      setState(() {
        isPlaying = false;
        animationController.reverse();
      });
    } else {
      await audioPlayer.setPlaybackRate(3);
      await audioPlayer.play(AssetSource("audio/${currentWorkout.audioName}"));
      setState(() {
        isPlaying = true;
        animationController.forward();
      });
    }
  }

  @override
  void initState() {
    workouts = WorkoutManager.workoutGroups[widget.groupIndex].workouts;
    workoutsIndex = widget.workoutsIndex;
    currentWorkout = workouts[workoutsIndex];
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {});
    });
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = ColorTween(begin: Colors.amber, end: Colors.red)
        .animate(animationController);
    WorkoutManager.increaseTodayWorkoutMinutes(currentWorkout.minutes);
    WorkoutManager.increaseTodayWorkoutCalories(currentWorkout.kcal);
    super.initState();
  }

  void nextWorkout() {
    if (workoutsIndex < workouts.length - 1) {
      workoutsIndex++;
    } else {
      workoutsIndex = 0;
    }
    currentWorkout = workouts[workoutsIndex];
    if (isPlaying) {
      isPlaying = false;
      animationController.reverse();
    }
  }

  void prevWorkout() {
    if (workoutsIndex > 0) {
      workoutsIndex--;
    } else {
      workoutsIndex = workouts.length - 1;
    }
    currentWorkout = workouts[workoutsIndex];
    if (isPlaying) {
      isPlaying = false;
      animationController.reverse();
    }
  }
}
