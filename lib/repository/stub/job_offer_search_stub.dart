import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class JobOfferSearchStub {
  static Future<List<dynamic>> _readJobOffers() async {
    final jobOfferListJson = await rootBundle
        .loadString('lib/repository/stub/job_offer_search_result.json');
    return jsonDecode(jobOfferListJson) as List<dynamic>;
  }

  static Future<Map<String, dynamic>> searchJobOffers(
      {int page = 0, int limit = 20}) async {
    final jobOffers = await _readJobOffers();
    final list = jobOffers.skip(limit * page).take(limit).toList();
    final total = jobOffers.length;
    return Future.delayed(
        const Duration(milliseconds: 200),
        () => {
              'total': total,
              'list': list,
            });
  }
}
