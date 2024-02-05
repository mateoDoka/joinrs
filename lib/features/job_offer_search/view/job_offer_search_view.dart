import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joinrs_flutter_challenge/app/joinrs_theme.dart';
import 'package:joinrs_flutter_challenge/app/widget/job_offer_tile.dart';
import 'package:joinrs_flutter_challenge/app/widget/joinrs_custom_navigation.dart';
import 'package:joinrs_flutter_challenge/features/job_offer_detail/job_offer_detail.dart';
import 'package:joinrs_flutter_challenge/features/job_offer_search/bloc/job_offer_search_view_bloc.dart';
import 'package:joinrs_flutter_challenge/repository/model/job-offer-item.dart';

class JobOfferSearchView extends StatelessWidget {
  const JobOfferSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Discover Job Offers',
          style: JoinrsTextTheme.headline4.copyWith(
            color: JoinrsColorScheme.textMain,
          ),
        ),
      ),
      bottomNavigationBar: const JoinrsBottomNavigation(),
      body: BlocBuilder<JobOfferSearchViewBloc, JobOfferSearchViewState>(
        builder: (context, state) {
          if (state is JobOfferSearchViewLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final loadedState = state as JobOfferSearchViewLoaded;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                for (final item in loadedState.jobOffers)
                  Column(
                    children: [
                      InkWell(
                        onTap: () => _handleJobOfferTap(context, item),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: JobOfferTile(item: item),
                        ),
                      ),
                      Divider(
                        color: JoinrsColorScheme.border,
                      ),
                    ],
                  ),
                if (loadedState.isNextPageLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else if (!loadedState.hasReachedMax)
                  ElevatedButton(
                    onPressed: () => context
                        .read<JobOfferSearchViewBloc>()
                        .add(JobOfferSearchNextPageEvent()),
                    child: Text("Next Page"),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _handleJobOfferTap(BuildContext context, JobOfferItem jobOfferItem) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (context) => JobOfferDetailPage(
        jobOfferId: jobOfferItem.id,
      ),
    ));
  }
}
