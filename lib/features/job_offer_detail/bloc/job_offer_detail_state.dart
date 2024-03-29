part of 'job_offer_detail_bloc.dart';

@immutable
sealed class JobOfferDetailState extends Equatable {
  const JobOfferDetailState();

  JobOfferDetailState loading() => JobOfferDetailViewLoading();

  JobOfferDetailViewLoaded loaded(
          {required JobOfferItem jobOffers, required bool isExpanded}) =>
      JobOfferDetailViewLoaded(jobOffers: jobOffers, isExpanded: isExpanded);
}

class JobOfferDetailViewLoading extends JobOfferDetailState {
  const JobOfferDetailViewLoading();
  @override
  List<Object> get props => [];
}

class JobOfferDetailInitial extends JobOfferDetailViewLoading {
  @override
  List<Object> get props => [];
}

class JobOfferDetailViewLoaded extends JobOfferDetailState {
  JobOfferDetailViewLoaded({
    required this.jobOffers,
    required this.isExpanded,
  });

  final JobOfferItem jobOffers;
  final bool isExpanded;

  @override
  List<Object> get props => [jobOffers, isExpanded];

  //change the state with updated values
  JobOfferDetailViewLoaded copyWith({
    JobOfferItem? jobOffers,
    bool? isExpanded,
  }) {
    return JobOfferDetailViewLoaded(
      jobOffers: jobOffers ?? this.jobOffers,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}
