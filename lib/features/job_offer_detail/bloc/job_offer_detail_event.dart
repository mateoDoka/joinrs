part of 'job_offer_detail_bloc.dart';

@immutable
sealed class JobOfferDetailEvent extends Equatable {
  const JobOfferDetailEvent();
}

class JobOfferDetailViewInitialEvent extends JobOfferDetailEvent {
  @override
  List<Object> get props => [];
}
