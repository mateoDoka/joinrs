import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joinrs_flutter_challenge/features/job_offer_detail/bloc/job_offer_detail_bloc.dart';
import 'package:joinrs_flutter_challenge/features/job_offer_detail/view/job_offer_detail_view.dart';

class JobOfferDetailPage extends StatelessWidget {
  const JobOfferDetailPage({required this.jobOfferId, super.key});

  final int jobOfferId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobOfferDetailBloc(
        jobOfferRepository: context.read(),
      ),
      child: const JobOfferDetailView(),
    );
  }
}
