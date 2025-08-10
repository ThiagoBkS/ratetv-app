import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/data_label.dart';
import 'package:project_a/widgets/info_section/info_item.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final List<DataLabel> details;
  const InfoSection({super.key, required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromRGBO(56, 63, 68, 0.25),
        border: Border.all(color: Color.fromRGBO(56, 63, 68, 1)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        spacing: 8.h,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Column(
            spacing: 4.h,
            children: List.generate(details.length, (index) {
              return InfoItem(data: details[index]);
            }),
          ),
        ],
      ),
    );
  }
}
