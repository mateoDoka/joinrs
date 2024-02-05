import 'package:joinrs_flutter_challenge/repository/model/job-offer-item.dart';
import 'package:joinrs_flutter_challenge/repository/model/pagination.dart';
import 'package:joinrs_flutter_challenge/repository/stub/job_offer_detail_stub.dart';
import 'package:joinrs_flutter_challenge/repository/stub/job_offer_search_stub.dart';

class JobOfferRepository {
  const JobOfferRepository();

  Future<Pagination<JobOfferItem>> searchJobOffers(int page) async {
    final resultJson = await JobOfferSearchStub.searchJobOffers(page: page);
    return Pagination.fromJson(resultJson, JobOfferItem.fromJson);
  }

  Future<JobOfferItem> getJobOffersDetails() async {
    final resultJson = await JobOfferSearchStubDettail.getJobOffer();
    return JobOfferItem.fromJson(resultJson);
  }
}
