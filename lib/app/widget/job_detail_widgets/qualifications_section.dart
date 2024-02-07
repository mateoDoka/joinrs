import 'package:flutter/material.dart';
import 'package:joinrs_flutter_challenge/app/joinrs_theme.dart';

class QualificationSection extends StatelessWidget {
  const QualificationSection({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });
  final IconData icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.teal),
            Text(
              title,
              style: JoinrsTextTheme.subtitle2,
            ),
            const SizedBox(height: 8),
            Text(
              subTitle,
              style: JoinrsTextTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
