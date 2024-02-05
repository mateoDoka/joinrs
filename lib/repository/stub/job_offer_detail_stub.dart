import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class JobOfferSearchStubDettail {
  static Future<Map<String, dynamic>> _readJobOffer() async {
    final jobOfferDetailExampleJson = await rootBundle
        .loadString('lib/repository/stub/job_offer_detail_result.json');
    return jsonDecode(jobOfferDetailExampleJson) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> getJobOffer() async {
    final jobOffer = await _readJobOffer();
    return Future.delayed(const Duration(milliseconds: 200), () => jobOffer);
  }
}
