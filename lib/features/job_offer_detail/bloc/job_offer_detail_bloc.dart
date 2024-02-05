import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:joinrs_flutter_challenge/repository/job_offer_repository.dart';
import 'package:joinrs_flutter_challenge/repository/model/job-offer-item.dart';

part 'job_offer_detail_event.dart';
part 'job_offer_detail_state.dart';

class JobOfferDetailBloc
    extends Bloc<JobOfferDetailEvent, JobOfferDetailState> {
  JobOfferDetailBloc({required JobOfferRepository jobOfferRepository})
      : super(JobOfferDetailInitial()) {
    on<JobOfferDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<JobOfferDetailViewInitialEvent>((event, emit) async {
      emit(state.loading());
      final jobOffers = await jobOfferRepository.getJobOffersDetails();

      emit(state.loaded(jobOffers: jobOffers, isExpanded: false));
    });

    add(JobOfferDetailViewInitialEvent());
  }
}
