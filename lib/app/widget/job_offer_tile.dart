import 'package:flutter/material.dart';
import 'package:joinrs_flutter_challenge/app/joinrs_theme.dart';
import 'package:joinrs_flutter_challenge/app/widget/score_gauge.dart';
import 'package:joinrs_flutter_challenge/repository/model/job-offer-item.dart';

class JobOfferTile extends StatelessWidget {
  const JobOfferTile({
    super.key,
    required this.item,
  });

  final JobOfferItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 98,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ScoreGauge(
              score: item.score,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.type.toUpperCase(),
                style: JoinrsTextTheme.overline.copyWith(
                  color: JoinrsColorScheme.textSecondary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                item.position,
                style: JoinrsTextTheme.subtitle2,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(Icons.business,
                      size: 17, color: JoinrsColorScheme.textSecondary),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    item.employer,
                    style: JoinrsTextTheme.overline,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: [
                  Label(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.place,
                          size: 10,
                          color: JoinrsColorScheme.primaryOrange,
                        ),
                        Text(
                          item.locations.first,
                          style: JoinrsTextTheme.overline.copyWith(
                            color: JoinrsColorScheme.primaryOrange,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  if (item.locations.length > 1)
                    Label(
                      child: Text(
                        ' +${item.locations.length - 1}',
                        style: JoinrsTextTheme.overline.copyWith(
                          color: JoinrsColorScheme.primaryOrange,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  Label(
                    child: Text(
                      'PAID JOB',
                      style: JoinrsTextTheme.overline.copyWith(
                        color: JoinrsColorScheme.primaryGreen,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Label extends StatelessWidget {
  const Label({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: JoinrsColorScheme.background,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            blurRadius: 53,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: child,
    );
  }
}
