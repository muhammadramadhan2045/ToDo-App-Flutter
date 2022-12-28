import 'package:flutter/material.dart';
import 'package:todolist_app/constants/colors.dart';

class MySearchBox extends StatefulWidget {
  final String hint;
  final Function(String?) onChanged;
  const MySearchBox({super.key, required this.hint, required this.onChanged});

  @override
  State<MySearchBox> createState() => _MySearchBoxState();
}

class _MySearchBoxState extends State<MySearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: wrnaPutih,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: const Icon(
            Icons.search,
            color: wrnaHitam,
            size: 20,
          ),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          hintText: widget.hint,
        ),
      ),
    );
  }
}
