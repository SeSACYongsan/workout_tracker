import 'package:flutter/material.dart';

class AnimatedIconWidget extends StatefulWidget {
  final IconData icon;
  final double size;
  final Color color;
  const AnimatedIconWidget(
      {super.key, required this.icon, required this.size, required this.color});
  @override
  State<AnimatedIconWidget> createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Transform.rotate(
        angle: animation.value * 0.0174533,
        child: Icon(
          widget.icon,
          size: widget.size,
          color: widget.color,
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    final curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOutSine);
    animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 40.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 40.0, end: -20.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -20.0, end: 7.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 7.0, end: -3.5), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -3.5, end: 1.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 1),
    ]).animate(curvedAnimation);
    animation.addListener(() {
      if (animation.status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (animation.status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    animationController.forward();
  }
}
