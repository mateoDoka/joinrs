import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joinrs_flutter_challenge/app/joinrs_theme.dart';
import 'package:joinrs_flutter_challenge/app/widget/job_offer_tile.dart';
import 'package:joinrs_flutter_challenge/app/widget/score_gauge.dart';
import 'package:joinrs_flutter_challenge/features/job_offer_detail/bloc/job_offer_detail_bloc.dart';

class JobOfferDetailView extends StatelessWidget {
  const JobOfferDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: Icon(Icons.bookmark),
          onPressed: () {},
        )
      ]),
      body: BlocBuilder<JobOfferDetailBloc, JobOfferDetailState>(
        builder: (context, state) {
          if (state is JobOfferDetailViewLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final loadedState = state as JobOfferDetailViewLoaded;

          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 98,
                      child: ScoreGauge(
                        score: loadedState.jobOffers.score,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              loadedState.jobOffers.type.toUpperCase(),
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
                              loadedState.jobOffers.position,
                              style: JoinrsTextTheme.subtitle2,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Icon(Icons.business,
                                    size: 17,
                                    color: JoinrsColorScheme.textSecondary),
                                Text(loadedState.jobOffers.employer)
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
                                      Icon(
                                        Icons.place,
                                        size: 10,
                                        color: JoinrsColorScheme.primaryOrange,
                                      ),
                                      Text(
                                        loadedState.jobOffers.locations.first,
                                        style:
                                            JoinrsTextTheme.overline.copyWith(
                                          color:
                                              JoinrsColorScheme.primaryOrange,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                if (loadedState.jobOffers.locations.length > 1)
                                  Label(
                                    child: Text(
                                      ' +${loadedState.jobOffers.locations.length - 1}',
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
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: const BoxDecoration(color: Colors.grey),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Company Description',
                            style: JoinrsTextTheme.subtitle1,
                          ),
                          InkWell(
                            child: const Icon(Icons.arrow_downward),
                            onTap: () {
                              //pass the bloc
                              //state here , so when on pressed to change the value of isExpanded
                              state.isExpanded = !state.isExpanded;
                              context
                                  .read<JobOfferDetailBloc>()
                                  .add(JobOfferDetailViewInitialEvent());
                            },
                          )
                        ],
                      ),
                      Text(
                        loadedState.jobOffers.employerDescription!,
                        style: JoinrsTextTheme.body2,
                        maxLines: loadedState.isExpanded ? 1 : 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
