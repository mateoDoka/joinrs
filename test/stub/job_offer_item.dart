import 'package:joinrs_flutter_challenge/repository/model/job-offer-item.dart';

class JobOfferItemStub extends JobOfferItem {
  const JobOfferItemStub({
    super.id = 1,
    super.position = 'position',
    super.score = 1.0,
    super.employer = 'employer',
    super.locations = const [
      'location2',
      'location1',
    ],
    super.type = 'type',
  });
}
