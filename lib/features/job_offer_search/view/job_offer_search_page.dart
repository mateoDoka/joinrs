import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joinrs_flutter_challenge/features/job_offer_search/bloc/job_offer_search_view_bloc.dart';
import 'package:joinrs_flutter_challenge/features/job_offer_search/view/job_offer_search_view.dart';

class JobOfferSearchPage extends StatelessWidget {
  const JobOfferSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobOfferSearchViewBloc(
        jobOfferRepository: context.read(),
      ),
      child: const JobOfferSearchView(),
    );
  }
}
