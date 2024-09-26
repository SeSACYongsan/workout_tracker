import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/components/animation_phrase.dart';
import 'package:workout_tracker/components/dashboard_card.dart';
import 'package:workout_tracker/models/workout_manager.dart';
import 'package:workout_tracker/widgets/animated_icon_widget.dart';

class WorkoutHomePage extends StatefulWidget {
  const WorkoutHomePage({super.key});
  @override
  State<WorkoutHomePage> createState() => _WorkoutHomePageState();
}

class _WorkoutHomePageState extends State<WorkoutHomePage> {
  late Future<int> monthlyCountFuture;
  late Future<int> workoutMinutesFuture;
  late Future<int> workoutKcalFuture;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Expanded(
                    child: AnimatedTextCarousel(),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Colors.orange,
                      ),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage("assets/images/me.jpg"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: DashboardCard(
                      info: FutureBuilder<int>(
                        future: monthlyCountFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text("Error: ${snapshot.error}");
                          } else {
                            final monthlyWorkoutCount = snapshot.data ?? 0;
                            return Text(
                              "$monthlyWorkoutCount회",
                              style: const TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }
                        },
                      ),
                      icon: const AnimatedIconWidget(
                        icon: Icons.fitness_center,
                        size: 33,
                        color: Colors.orange,
                      ),
                      title: const Text(
                        "Monthly",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: DashboardCard(
                            info: FutureBuilder(
                              future: workoutMinutesFuture,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text("Error: ${snapshot.error}");
                                } else {
                                  return Text(
                                    "${snapshot.data}분",
                                    style: const TextStyle(
                                      fontSize: 33,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }
                              },
                            ),
                            icon: const AnimatedIconWidget(
                              icon: Icons.update,
                              size: 33,
                              color: Colors.orange,
                            ),
                            title: const Text(
                              "오늘 운동 시간",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: DashboardCard(
                            info: FutureBuilder(
                              future: workoutKcalFuture,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text("Error: ${snapshot.error}");
                                } else {
                                  return Text(
                                    "${snapshot.data}kcal",
                                    style: const TextStyle(
                                      fontSize: 33,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }
                              },
                            ),
                            icon: const AnimatedIconWidget(
                              icon: Icons.fitness_center,
                              size: 33,
                              color: Colors.orange,
                            ),
                            title: const Text(
                              "소모 칼로리",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Hero(
                      tag: "group_0",
                      child: SizedBox(
                        width: 250,
                        child: DashboardCard(
                          customOnTap: () {
                            context.go("/workout_home/workout_list/0");
                          },
                          imageName: "sample1.png",
                          backgroundColor: Colors.orange,
                          info: Text(
                            WorkoutManager.workoutGroups[0].groupDescription,
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          icon: const Icon(
                            Icons.run_circle_outlined,
                            size: 33,
                            color: Colors.white,
                          ),
                          title: const Text(
                            "그룹1",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: "group_1",
                      child: SizedBox(
                        width: 250,
                        child: DashboardCard(
                          customOnTap: () {
                            context.go("/workout_home/workout_list/1");
                          },
                          imageName: "sample2.png",
                          backgroundColor: Colors.teal,
                          info: Text(
                            WorkoutManager.workoutGroups[1].groupDescription,
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          icon: const Icon(
                            Icons.rowing_outlined,
                            size: 33,
                            color: Colors.white,
                          ),
                          title: const Text(
                            "그룹2",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: DashboardCard(
                customOnTap: () {
                  if (WorkoutManager.currentWorkoutGroupIndex == null) {
                    return;
                  }
                  context.go(
                      "/workout_home/workout_list/${WorkoutManager.currentWorkoutGroupIndex}");
                },
                backgroundColor: Colors.black87,
                info: const Text(
                  "당신의 몸은 해낼 수 있다. 당신의 마음만 설득하면 된다.",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                  ),
                ),
                icon: const Icon(
                  Icons.list,
                  size: 33,
                  color: Colors.orange,
                ),
                title: const Text(
                  "운동 이어서 하기",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant WorkoutHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    monthlyCountFuture = WorkoutManager.getMonthlyWorkoutCount();
    workoutMinutesFuture = WorkoutManager.getTodayWorkoutMinutes();
    workoutKcalFuture = WorkoutManager.getTodayWorkoutCalories();
  }

  @override
  void initState() {
    super.initState();
    monthlyCountFuture = WorkoutManager.getMonthlyWorkoutCount();
    workoutMinutesFuture = WorkoutManager.getTodayWorkoutMinutes();
    workoutKcalFuture = WorkoutManager.getTodayWorkoutCalories();
  }
}
