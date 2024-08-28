import 'package:flutter/material.dart';

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
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/images/squat.jpeg", width: 70),
                Expanded(
                  child: Text(
                    "1. 스쿼트",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Text(
                  "05:30",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.blue,
                      ),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset("assets/images/mountain_climber.jpeg", width: 70),
                Expanded(
                  child: Text(
                    "1. 마운틴 클라이머",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Text(
                  "25:30",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.blue,
                      ),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset("assets/images/benchpress.jpeg", width: 70),
                Expanded(
                  child: Text(
                    "1. 벤치프레스",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Text(
                  "12:30",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.blue,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
