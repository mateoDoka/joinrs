import 'package:flutter/material.dart';
import 'package:joinrs_flutter_challenge/app/joinrs_theme.dart';
import 'package:joinrs_flutter_challenge/app/widget/job_offer_tile.dart';
import 'package:joinrs_flutter_challenge/app/widget/score_gauge.dart';

class JobOfferHeader extends StatelessWidget {
  const JobOfferHeader({
    super.key,
    required this.score,
    required this.type,
    required this.position,
    required this.employer,
    required this.locations,
  });
  final double score;
  final String type;
  final String position;
  final String employer;
  final List<String> locations;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 98,
          child: ScoreGauge(
            score: score,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type.toUpperCase(),
                  style: JoinrsTextTheme.overline.copyWith(
                    color: JoinrsColorScheme.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  position,
                  style: JoinrsTextTheme.subtitle2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Icon(Icons.business,
                        size: 17, color: JoinrsColorScheme.textSecondary),
                    Text(employer),
                  ],
                ),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    Label(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.place,
                              size: 10, color: JoinrsColorScheme.primaryOrange),
                          Text(
                            locations.first,
                            style: JoinrsTextTheme.overline.copyWith(
                                color: JoinrsColorScheme.primaryOrange),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    if (locations.length > 1)
                      Label(
                        child: Text(
                          ' +${locations.length - 1}',
                          style: JoinrsTextTheme.overline
                              .copyWith(color: JoinrsColorScheme.primaryOrange),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    Label(
                      child: Text(
                        'PAID JOB',
                        style: JoinrsTextTheme.overline
                            .copyWith(color: JoinrsColorScheme.primaryGreen),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
