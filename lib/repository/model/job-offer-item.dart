import 'package:equatable/equatable.dart';

class JobOfferItem extends Equatable {
  const JobOfferItem({
    required this.id,
    required this.position,
    required this.score,
    required this.employer,
    required this.locations,
    required this.type,
    this.employerDescription,
    this.matchingStudyPath,
    this.matchingStudyLevel,
  });

  factory JobOfferItem.fromJson(Map<String, dynamic> json) => JobOfferItem(
        id: json['id'] as int,
        position: json['position'] as String,
        score: double.parse(json['score'].toString()),
        employer: json['employer'] as String,
        locations: (json['locations'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        type: json['type'] as String,
        employerDescription: json['employerDescription'] as String?,
        matchingStudyPath: json[' matchingStudyPath'] as String?,
        matchingStudyLevel: json[' matchingStudyLevel'] as String?,
      );

  final int id;
  final String position;
  final double score;
  final String employer;
  final List<String> locations;
  final String type;
  final String? employerDescription;
  final String? matchingStudyPath;
  final String? matchingStudyLevel;

  @override
  List<Object?> get props => [
        id,
        position,
        score,
        employer,
        locations,
        type,
        employerDescription,
        matchingStudyPath,
        matchingStudyLevel
      ];
}
