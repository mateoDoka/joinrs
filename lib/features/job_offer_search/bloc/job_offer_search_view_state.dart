part of 'job_offer_search_view_bloc.dart';

abstract class JobOfferSearchViewState extends Equatable {
  const JobOfferSearchViewState();

  JobOfferSearchViewState loading() => JobOfferSearchViewLoading();

  JobOfferSearchViewState loaded({
    required List<JobOfferItem> jobOffers,
    required bool hasReachedMax,
  }) =>
      JobOfferSearchViewLoaded(
        jobOffers: jobOffers,
        hasReachedMax: hasReachedMax,
        isNextPageLoading: false,
      );
}

class JobOfferSearchViewLoading extends JobOfferSearchViewState {
  const JobOfferSearchViewLoading();
  @override
  List<Object> get props => [];
}

class JobOfferSearchViewInitial extends JobOfferSearchViewLoading {
  @override
  List<Object> get props => [];
}

class JobOfferSearchViewLoaded extends JobOfferSearchViewState {
  const JobOfferSearchViewLoaded({
    required this.jobOffers,
    required this.hasReachedMax,
    required this.isNextPageLoading,
  });

  final List<JobOfferItem> jobOffers;
  final bool hasReachedMax;
  final bool isNextPageLoading;

  JobOfferSearchViewLoaded copyWith({
    List<JobOfferItem>? jobOffers,
    bool? hasReachedMax,
    bool? isNextPageLoading,
  }) {
    return JobOfferSearchViewLoaded(
      jobOffers: jobOffers ?? this.jobOffers,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isNextPageLoading: isNextPageLoading ?? this.isNextPageLoading,
    );
  }

  JobOfferSearchViewLoaded nextPageLoading() {
    return copyWith(
      isNextPageLoading: true,
    );
  }

  JobOfferSearchViewLoaded nextPageLoaded({
    required List<JobOfferItem> jobOffers,
    required bool hasReachedMax,
  }) {
    return copyWith(
      jobOffers: [...this.jobOffers, ...jobOffers],
      hasReachedMax: hasReachedMax,
      isNextPageLoading: false,
    );
  }

  @override
  List<Object> get props => [jobOffers, hasReachedMax, isNextPageLoading];
}
