import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joinrs_flutter_challenge/features/job_offer_search/view/job_offer_search_page.dart';
import 'package:joinrs_flutter_challenge/l10n/l10n.dart';
import 'package:joinrs_flutter_challenge/repository/job_offer_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(
      colorSchemeSeed: const Color(0xffFA4B19),
      useMaterial3: true,
    );
    final textTheme = GoogleFonts.nunitoTextTheme(baseTheme.textTheme);

    return RepositoryProvider(
      create: (context) => const JobOfferRepository(),
      child: MaterialApp(
        theme: baseTheme.copyWith(
          textTheme: textTheme,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const JobOfferSearchPage(),
      ),
    );
  }
}
