import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final Icon icon;
  final Text title;
  final Text info;
  final Color? backgroundColor;
  const DashboardCard({
    super.key,
    required this.icon,
    required this.title,
    required this.info,
    this.backgroundColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor ?? Colors.grey.shade300,
      ),
      child: Column(
        children: [
          Row(
            children: [
              icon,
              const SizedBox(width: 10),
              title,
            ],
          ),
          Expanded(
            child: Center(
              child: info,
            ),
          ),
        ],
      ),
    );
  }
}
