import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final Icon icon;
  final Text title;
  final Widget info;
  final Color? backgroundColor;
  final String? imageName;
  final void Function()? customOnTap;
  const DashboardCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.info,
      this.backgroundColor,
      this.imageName,
      this.customOnTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: customOnTap,
      child: Container(
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
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: info,
                    ),
                  ),
                  if (imageName != null)
                    Image.asset("assets/images/$imageName"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
