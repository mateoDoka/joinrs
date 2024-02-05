import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:joinrs_flutter_challenge/repository/job_offer_repository.dart';
import 'package:joinrs_flutter_challenge/repository/model/job-offer-item.dart';

part 'job_offer_search_view_event.dart';
part 'job_offer_search_view_state.dart';

class JobOfferSearchViewBloc
    extends Bloc<JobOfferSearchViewEvent, JobOfferSearchViewState> {
  JobOfferSearchViewBloc({
    required JobOfferRepository jobOfferRepository,
  }) : super(JobOfferSearchViewInitial()) {
    on<JobOfferSearchViewEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<JobOfferSearchViewInitialEvent>((event, emit) async {
      emit(state.loading());
      final jobOffers = await jobOfferRepository.searchJobOffers(0);
      emit(state.loaded(
        jobOffers: jobOffers.items,
        hasReachedMax: jobOffers.items.length >= jobOffers.total,
      ));
    });
    on<JobOfferSearchNextPageEvent>((event, emit) async {
      if (state is JobOfferSearchViewLoaded) {
        final currentState = state as JobOfferSearchViewLoaded;
        if (!currentState.hasReachedMax && !currentState.isNextPageLoading) {
          emit(currentState.nextPageLoading());
          final jobOffers = await jobOfferRepository.searchJobOffers(
            currentState.jobOffers.length ~/ 10,
          );
          emit(currentState.nextPageLoaded(
            jobOffers: jobOffers.items,
            hasReachedMax: jobOffers.items.length + currentState.jobOffers.length >= jobOffers.total,
          ));
        }
      }
    });
    add(JobOfferSearchViewInitialEvent());
  }
}
