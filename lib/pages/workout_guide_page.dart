import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class WorkoutGuidePage extends StatefulWidget {
  const WorkoutGuidePage({super.key});
  @override
  State<WorkoutGuidePage> createState() => _WorkoutGuidePageState();
}

class _WorkoutGuidePageState extends State<WorkoutGuidePage> {
  final audioPlayer = AudioPlayer();
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
                "스쿼트",
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 50,
                    ),
                  ),
                  Expanded(
                    child: Image.asset("assets/images/squat.jpeg"),
                  ),
                  IconButton(
                    onPressed: () {},
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
                "30분",
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
          await audioPlayer.play(AssetSource("audio/squat.mp3"));
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
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {});
    });
    super.initState();
  }
}
