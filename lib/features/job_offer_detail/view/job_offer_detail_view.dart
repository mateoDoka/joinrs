import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joinrs_flutter_challenge/app/joinrs_theme.dart';
import 'package:joinrs_flutter_challenge/app/widget/job_detail_widgets/company_description.dart';
import 'package:joinrs_flutter_challenge/app/widget/job_detail_widgets/job_detail_header.dart';
import 'package:joinrs_flutter_challenge/app/widget/job_detail_widgets/qualifications_section.dart';

import 'package:joinrs_flutter_challenge/features/job_offer_detail/bloc/job_offer_detail_bloc.dart';

class JobOfferDetailView extends StatelessWidget {
  const JobOfferDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: JoinrsColorScheme.primaryOrange,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Candidati',
                style: JoinrsTextTheme.button,
              ),
            ),
          )),
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.bookmark),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Header widget
                  JobOfferHeader(
                    score: loadedState.jobOffers.score,
                    type: loadedState.jobOffers.type,
                    position: loadedState.jobOffers.position,
                    employer: loadedState.jobOffers.employer,
                    locations: loadedState.jobOffers.locations,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //Company Description Widget
                  CompanyDescriptionSection(
                    description: loadedState.jobOffers.employerDescription!,
                    isExpanded: loadedState.isExpanded,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Qualification Widget
                      QualificationSection(
                        icon: FontAwesomeIcons.bookOpen,
                        title: 'Computer Science',
                        subTitle: 'Your study path matches this job offer ',
                      ),
                      SizedBox(width: 20),
                      QualificationSection(
                        icon: FontAwesomeIcons.graduationCap,
                        title: 'Master Degree',
                        subTitle: 'Your study level matches this job offer ',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
