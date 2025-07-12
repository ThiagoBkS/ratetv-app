import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String) onChanged;
  final VoidCallback onClear;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: SearchBar(
        controller: controller,
        onChanged: onChanged,
        hintText: hintText,
        leading: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
          child: Icon(LucideIcons.search, size: 20),
        ),
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        trailing: [
          if (controller.text.isNotEmpty)
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 4, vertical: 0),
              child: SizedBox(
                height: 28,
                width: 28,
                child: InkWell(
                  borderRadius: BorderRadius.circular(32),
                  onTap: onClear,
                  child: Icon(LucideIcons.x, size: 20),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
