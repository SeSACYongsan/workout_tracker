import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
      ),
    );
  }
}

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
                    child: DashboardCard(),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: DashboardCard(),
                        ),
                        Expanded(
                          child: DashboardCard(),
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
                      child: DashboardCard(),
                    ),
                    SizedBox(
                      width: 250,
                      child: DashboardCard(),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 3,
              child: DashboardCard(),
            ),
          ],
        ),
      ),
    );
  }
}
