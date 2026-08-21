import 'package:flutter/material.dart';

import '../../../../common/design/design.dart';

class ProfileDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final Function(String) onChanged;

  const ProfileDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.07),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          dropdownColor: const Color(0xFF1B2838),
          isExpanded: true,
          items: items
              .map((e) => DropdownMenuItem(
            value: e,
            child: Text(e,
                style: const TextStyle(
                    color: Colors.white)),
          ))
              .toList(),
          onChanged: (val) => onChanged(val!),
        ),
      ),
    );
  }
}