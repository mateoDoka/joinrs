part of 'job_offer_search_view_bloc.dart';

abstract class JobOfferSearchViewEvent extends Equatable {
  const JobOfferSearchViewEvent();
}

class JobOfferSearchNextPageEvent extends JobOfferSearchViewEvent {
  @override
  List<Object> get props => [];
}

class JobOfferSearchViewInitialEvent extends JobOfferSearchViewEvent {
  @override
  List<Object> get props => [];
}
