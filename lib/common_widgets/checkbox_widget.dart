import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          border: Border.all(color: value ? const Color(0xFF8C59C8) : Colors.grey, width: 1.5),
          borderRadius: BorderRadius.circular(4),
          color: value ? const Color(0xFF8C59C8) : Colors.white,
        ),
        child: value
            ? const Center(
          child: Icon(
            Icons.check,
            size: 16.0,
            color: Colors.white,
          ),
        )
            : null,
      ),
    );
  }
}