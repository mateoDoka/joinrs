import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:joinrs_flutter_challenge/features/job_offer_search/bloc/job_offer_search_view_bloc.dart';
import 'package:joinrs_flutter_challenge/repository/job_offer_repository.dart';
import 'package:joinrs_flutter_challenge/repository/model/pagination.dart';
import 'package:mocktail/mocktail.dart';

import '../../stub/job_offer_item.dart';

class MockJobOfferRepository extends Mock implements JobOfferRepository {}

void main() {
  group('JobOfferSearchViewBloc', () {
    late JobOfferRepository jobOfferRepository;

    setUp(() {
      jobOfferRepository = MockJobOfferRepository();
    });

    blocTest<JobOfferSearchViewBloc, JobOfferSearchViewState>(
      'emits [JobOfferSearchViewLoading, JobOfferSearchViewLoaded] when jobOfferRepository returns data',
      setUp: () {
        when(() => jobOfferRepository.searchJobOffers(0))
            .thenAnswer((_) async => Pagination(total: 20, items: [
                  JobOfferItemStub(id: 1),
                  JobOfferItemStub(id: 2),
                ]));
      },
      build: () =>
          JobOfferSearchViewBloc(jobOfferRepository: jobOfferRepository),
      expect: () => [
        JobOfferSearchViewLoading(),
        const JobOfferSearchViewLoaded(
          jobOffers: [
            JobOfferItemStub(id: 1),
            JobOfferItemStub(id: 2),
          ],
          hasReachedMax: false,
          isNextPageLoading: false,
        ),
      ],
    );
  });
}
