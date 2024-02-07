import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joinrs_flutter_challenge/app/joinrs_theme.dart';

class CompanyDescriptionSection extends StatelessWidget {
  const CompanyDescriptionSection({
    super.key,
    required this.description,
    required this.isExpanded,
  });
  final String description;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Company Description',
                style: JoinrsTextTheme.subtitle1,
              ),
              InkWell(
                child: Icon(
                  isExpanded ? Icons.arrow_upward : Icons.arrow_downward,
                ),
                onTap: () {
                  // Toggle description event
                },
              )
            ],
          ),
          Text(
            description,
            style: GoogleFonts.nunito(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF6C757D)),
            maxLines: isExpanded ? 100 : 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
