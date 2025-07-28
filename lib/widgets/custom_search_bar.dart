import 'dart:async';

import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final FocusNode focusNode;

  final Function(String) onSearch;
  final int debounceMiliseconds;

  const CustomSearchBar({
    super.key,
    required this.onSearch,
    required this.focusNode,
    this.debounceMiliseconds = 500,
  });

  @override
  State<StatefulWidget> createState() {
    return CustomSearchBarState();
  }
}

class CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(Duration(milliseconds: widget.debounceMiliseconds), () {
      widget.onSearch(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: SearchBar(
          focusNode: FocusNode(),
          onChanged: (value) {
            _onChanged(value);
          },
          controller: _controller,
          backgroundColor: WidgetStatePropertyAll(
            Color.fromRGBO(36, 41, 44, 1),
          ),
          elevation: WidgetStatePropertyAll(0),
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 8)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          leading: Padding(
            padding: EdgeInsetsDirectional.only(start: 8),
            child: Icon(Icons.search),
          ),
          hintText: "Busque por filmes ou atores",
        ),
      ),
    );
  }
}
