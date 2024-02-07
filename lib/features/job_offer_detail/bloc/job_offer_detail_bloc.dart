import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:joinrs_flutter_challenge/repository/job_offer_repository.dart';
import 'package:joinrs_flutter_challenge/repository/model/job-offer-item.dart';

part 'job_offer_detail_event.dart';
part 'job_offer_detail_state.dart';

class JobOfferDetailBloc
    extends Bloc<JobOfferDetailEvent, JobOfferDetailState> {
  final JobOfferRepository jobOfferRepository;

  JobOfferDetailBloc({required this.jobOfferRepository})
      : super(JobOfferDetailInitial()) {
    on<JobOfferDetailViewInitialEvent>((event, emit) async {
      emit(state.loading());
      final jobOffers = await jobOfferRepository.getJobOffersDetails();
      emit(JobOfferDetailViewLoaded(jobOffers: jobOffers, isExpanded: false));
    });
//update the state when the value of isExpanded changes
    on<ToggleDescriptionEvent>((event, emit) {
      if (state is JobOfferDetailViewLoaded) {
        final currentState = state as JobOfferDetailViewLoaded;
        emit(currentState.copyWith(isExpanded: !currentState.isExpanded));
      }
    });

    add(JobOfferDetailViewInitialEvent());
  }
}
