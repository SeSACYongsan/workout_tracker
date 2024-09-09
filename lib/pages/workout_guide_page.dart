import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:workout_tracker/models/workout.dart';

class WorkoutGuidePage extends StatefulWidget {
  const WorkoutGuidePage({super.key});
  @override
  State<WorkoutGuidePage> createState() => _WorkoutGuidePageState();
}

class _WorkoutGuidePageState extends State<WorkoutGuidePage> {
  late Workout currentWorkout;
  List<Workout> workouts = [
    Workout(
        name: '스쿼트',
        minutes: 30,
        imageName: 'squat.jpeg',
        audioName: 'squat.mp3',
        kcal: 200),
    Workout(
        name: '사이드런지',
        minutes: 20,
        imageName: 'side_lunge.jpeg',
        audioName: 'side_lunge.mp3',
        kcal: 100),
    Workout(
        name: '푸쉬업',
        minutes: 15,
        imageName: 'pushup.jpeg',
        audioName: 'pushup.mp3',
        kcal: 100),
    Workout(
        name: '마운틴클림버',
        minutes: 15,
        imageName: 'mountain_climber.jpeg',
        audioName: 'mountain_climber.mp3',
        kcal: 50),
    Workout(
        name: '런지',
        minutes: 20,
        imageName: 'lunge.jpeg',
        audioName: 'lunge.mp3',
        kcal: 100),
    Workout(
        name: '덤벨컬',
        minutes: 40,
        imageName: 'dumbell_curl.jpeg',
        audioName: 'dumbell_curl.mp3',
        kcal: 200),
    Workout(
        name: '덩키킥',
        minutes: 30,
        imageName: 'donkey_kick.jpeg',
        audioName: 'donkey_kick.mp3',
        kcal: 50),
    Workout(
        name: '친업',
        minutes: 25,
        imageName: 'chinup.jpeg',
        audioName: 'chinup.mp3',
        kcal: 300),
    Workout(
        name: '벤치프레스',
        minutes: 1,
        imageName: 'benchpress.jpeg',
        audioName: 'benchpress.mp3',
        kcal: 250),
  ];
  final audioPlayer = AudioPlayer();
  int workoutsIndex = 0;
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
    super.dispose();
  }

  IconButton getIconButton() {
    if (audioPlayer.state == PlayerState.playing) {
      return IconButton(
        onPressed: () async {
          await audioPlayer.stop();
          setState(() {});
        },
        icon: const Icon(
          Icons.stop_circle,
          size: 50,
          color: Colors.red,
        ),
      );
    } else {
      return IconButton(
        onPressed: () async {
          await audioPlayer.setPlaybackRate(3);
          await audioPlayer
              .play(AssetSource("audio/${currentWorkout.audioName}"));
          setState(() {});
        },
        icon: const Icon(
          Icons.play_circle_fill,
          size: 50,
          color: Colors.red,
        ),
      );
    }
  }

  @override
  void initState() {
    currentWorkout = workouts[workoutsIndex];
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {});
    });
    super.initState();
  }

  void nextWorkout() {
    if (workoutsIndex < workouts.length - 1) {
      workoutsIndex++;
    } else {
      workoutsIndex = 0;
    }
    currentWorkout = workouts[workoutsIndex];
  }

  void prevWorkout() {
    if (workoutsIndex > 0) {
      workoutsIndex--;
    } else {
      workoutsIndex = workouts.length - 1;
    }
    currentWorkout = workouts[workoutsIndex];
  }
}
