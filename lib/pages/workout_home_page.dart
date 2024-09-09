import 'package:flutter/material.dart';
import 'package:workout_tracker/components/dashboard_card.dart';

class WorkoutHomePage extends StatefulWidget {
  const WorkoutHomePage({super.key});
  @override
  State<WorkoutHomePage> createState() => _WorkoutHomePageState();
}

class _WorkoutHomePageState extends State<WorkoutHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Column(
                    children: [
                      Text("Just do it"),
                      Text("간단하다. 흔들리면 그것은 지방이다."),
                    ],
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/me.jpg"),
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(
              flex: 6,
              child: Row(
                children: [
                  Expanded(
                    child: DashboardCard(
                      icon: Icon(
                        Icons.fitness_center,
                        size: 33,
                        color: Colors.orange,
                      ),
                      title: Text(
                        "Monthly",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: DashboardCard(
                            icon: Icon(
                              Icons.update,
                              size: 33,
                              color: Colors.orange,
                            ),
                            title: Text(
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
                            icon: Icon(
                              Icons.fitness_center,
                              size: 33,
                              color: Colors.orange,
                            ),
                            title: Text(
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
                  )
                ],
              ),
            ),
            const Expanded(
              flex: 4,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 250,
                      child: DashboardCard(
                        icon: Icon(
                          Icons.run_circle_outlined,
                          size: 33,
                          color: Colors.white,
                        ),
                        title: Text(
                          "그룹1",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: DashboardCard(
                        icon: Icon(
                          Icons.rowing_outlined,
                          size: 33,
                          color: Colors.white,
                        ),
                        title: Text(
                          "그룹2",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 3,
              child: DashboardCard(
                icon: Icon(
                  Icons.list,
                  size: 33,
                  color: Colors.orange,
                ),
                title: Text(
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
}
