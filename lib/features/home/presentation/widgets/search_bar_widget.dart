import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xff161A23),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white10,
        ),
      ),
      child: const TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Search football fields...",
          hintStyle: TextStyle(
            color: Colors.white38,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white54,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}