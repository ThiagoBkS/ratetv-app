import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/utils/palette.dart';

class Collection {
  final String title;
  final String description;
  final String backdropUrl;

  const Collection({
    required this.title,
    required this.description,
    required this.backdropUrl,
  });
}

class CollectionCard extends StatelessWidget {
  final Collection collection;
  final Color color;
  const CollectionCard({
    super.key,
    required this.collection,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 8,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          border: BoxBorder.all(
            color: Color.fromRGBO(50, 60, 80, 1).withAlpha(100),
            width: 1.5,
          ),
        ),
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final maxWidth = constraints.maxWidth;
              final maxHeight = constraints.maxHeight;

              return AspectRatio(
                aspectRatio: 7 / 3,
                child: Stack(
                  children: [
                    SizedBox(
                      width: maxWidth,
                      height: maxHeight,
                      child: Image.network(
                        collection.backdropUrl,
                        width: maxWidth,
                        height: maxHeight,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Container(
                      width: maxWidth,
                      height: maxHeight,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            color.withAlpha(255),
                            color.withAlpha(255),
                            color.withAlpha(127),
                          ],
                          stops: [0.35, 0.45, 0.8],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.w),
                      child: FractionallySizedBox(
                        widthFactor: 0.65,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 4.h,
                          children: [
                            Text(
                              collection.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                color: Colors.blue[50],
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              collection.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(4.r),
                      child: InkWell(onTap: () {}, onLongPress: () {}),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
