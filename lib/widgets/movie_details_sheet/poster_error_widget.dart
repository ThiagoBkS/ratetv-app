import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class PosterErrorWidget extends StatelessWidget {
  final String? title;
  final double iconSize;

  const PosterErrorWidget({super.key, this.title, required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4,
      children: [
        Icon(
          LucideIcons.imageOff300,
          color: Color.fromRGBO(56, 63, 68, 1),
          size: iconSize,
        ),
        if (title != null && title!.isNotEmpty)
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              title!,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(color: Color.fromRGBO(56, 63, 68, 1)),
            ),
          ),
      ],
    );
  }
}
