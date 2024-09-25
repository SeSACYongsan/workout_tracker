import 'package:flutter/material.dart';

class AnimationPracticeWidget extends StatefulWidget {
  const AnimationPracticeWidget({super.key});
  @override
  State<AnimationPracticeWidget> createState() =>
      _AnimationPracticeWidgetState();
}

class _AnimationPracticeWidgetState extends State<AnimationPracticeWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: animation.value,
        height: animation.value,
        color: Colors.blue,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    final curvedAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.elasticInOut);
    animation = Tween<double>(begin: 50, end: 200).animate(curvedAnimation);
    animation.addListener(() {
      setState(() {});
    });
    animationController.forward();
  }
}
