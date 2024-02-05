import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:joinrs_flutter_challenge/features/job_offer_search/bloc/job_offer_search_view_bloc.dart';
import 'package:joinrs_flutter_challenge/features/job_offer_search/view/job_offer_search_view.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';
import '../../stub/job_offer_item.dart';

class MockJobOfferSearchBloc
    extends MockBloc<JobOfferSearchViewEvent, JobOfferSearchViewState>
    implements JobOfferSearchViewBloc {}

void main() {
  group('JobOfferSearch', () {
    late MockJobOfferSearchBloc jobOfferSearchBloc;

    setUp(() {
      jobOfferSearchBloc = MockJobOfferSearchBloc();
    });

    testWidgets('renders progress indicator when state is loading',
        (tester) async {
      const state = JobOfferSearchViewLoading();
      when(() => jobOfferSearchBloc.state).thenReturn(state);
      await tester.pumpApp(
        BlocProvider<JobOfferSearchViewBloc>(
          create: (_) => jobOfferSearchBloc,
          child: const JobOfferSearchView(),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders job offer', (tester) async {
      const state = JobOfferSearchViewLoaded(
        jobOffers: [
          JobOfferItemStub(position: 'Job offer A'),
          JobOfferItemStub(position: 'Job offer B'),
        ],
        hasReachedMax: false,
        isNextPageLoading: false,
      );
      when(() => jobOfferSearchBloc.state).thenReturn(state);
      await tester.pumpApp(
        BlocProvider<JobOfferSearchViewBloc>(
          create: (_) => jobOfferSearchBloc,
          child: const JobOfferSearchView(),
        ),
      );
      expect(find.text('Job offer A'), findsOneWidget);
      expect(find.text('Job offer B'), findsOneWidget);
    });
  });
}
