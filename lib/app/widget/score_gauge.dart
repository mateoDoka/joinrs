import 'package:flutter/material.dart';
import 'package:joinrs_flutter_challenge/app/joinrs_theme.dart';

class ScoreGauge extends StatelessWidget {
  const ScoreGauge({
    required this.score,
    super.key,
  });

  final double score;

  @override
  Widget build(BuildContext context) {
    final scoreText = "${(score * 100).ceil()}%";
    final fileName = getEmotionFileName((score * 100).ceil(), true);
    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        painter: RadialPainter(score: score),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                scoreText,
                style: JoinrsTextTheme.caption.copyWith(
                  color: JoinrsColorScheme.primaryGreen,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: ClipOval(
                  child: Image(
                    image: AssetImage('assets/emotion/${fileName}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String getEmotionFileName(int score, bool showScore) {
    if (score <= 25) {
      return 'emotion_25.png';
    } else if (score <= 50) {
      return 'emotion_50.png';
    } else if (score <= 60) {
      return 'emotion_60.png';
    } else if (score <= 70) {
      return 'emotion_70.png';
    } else if (score <= 80) {
      return 'emotion_80.png';
    } else if (score <= 90) {
      return 'emotion_90.png';
    } else {
      return 'emotion_100.png';
    }
  }
}

class RadialPainter extends CustomPainter {
  RadialPainter({
    required this.score,
  }) : super();

  final double score;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final center = Offset(radius, radius);
    final paint = Paint()
      ..color = JoinrsColorScheme.primaryGreen
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final greyPaint = Paint()
      ..color = JoinrsColorScheme.border
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final percent = score;
    final arcAngle = 2 * 3.14 * (percent * 0.75);
    const startAngle = 3.14 * 0.75;
    canvas
      ..drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        2 * 3.14 * 0.75,
        false,
        greyPaint,
      )
      ..drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        arcAngle,
        false,
        paint,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

Color getColorFromScore(double score) {
  if (score == 0) {
    return const Color(0xffE11400);
  } else if (score < 0.50) {
    return const Color(0xffFFC300);
  } else {
    return const Color(0xff0FB491);
  }
}
