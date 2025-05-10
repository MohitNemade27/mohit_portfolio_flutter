import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/candidate_detail/candidates_details_header.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/candidate_detail/detail_field_widget.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/candidate_detail/info_message_widget.dart';
import 'package:mohit_portfolio_flutter_web/app/common_widgets/hightlighted_detail_field.dart';

void showCandidateDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Dialog(
          backgroundColor: Colors.white.withOpacity(0.1),
          insetPadding: const EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 550),
            decoration: BoxDecoration(
              color:  Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title bar
                  const CandidateDetailsHeader(),

                  // Content
                  Flexible(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Info message
                            InfoMessage(
                              message: 'Welcome to my profile! If you\'d like to access more information '
                                  'or get in touch with me, please click on the download button.',
                            ),
                            const SizedBox(height: 20),
                            // Candidate details
                            const DetailField(label: 'My Name', value: 'Mohit Nemade'),
                            const DetailField(label: 'Company Name', value: 'Wolters Kluwer pvt Ltd.'),
                            const HighlightedDetailField(label: 'Employment Status', value: 'No, not resigned yet'),
                            const DetailField(label: 'Notice Period', value: '60 days'),
                            const HighlightedDetailField(label: 'Expected CTC', value: '₹15,84000'),
                            const HighlightedDetailField(label: 'Current CTC', value: '₹10,84000'),
                            const HighlightedDetailField(label: 'Skills', value: 'Flutter, Dart, Android, Github (version control)'),
                            const HighlightedDetailField(label: 'Relevant Experience', value: '3 years 7 months'),
                            const DetailField(label: 'Other Skills', value: 'Html/css/java-scrip, Java, kotlin'),
                            const DetailField(label: 'Ready To Relocate', value: 'Nashik, Pune, Bengaluru'),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Close button at bottom
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
