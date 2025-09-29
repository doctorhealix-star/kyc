import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/fonts.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String selectedGender = "Male"; // Default selection

  final List<Map<String, dynamic>> genders = [
    {"label": "Male", "icon": Icons.male},
    {"label": "Female", "icon": Icons.female},
    {"label": "Other", "icon": Icons.transgender},
  ];



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: genders.map((gender) {
        final bool isSelected = selectedGender == gender["label"];
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedGender = gender["label"];
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color:  Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
             border: Border.all( color:isSelected ? primary : Colors.grey,)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  gender["icon"],
                  color: isSelected ? primary : blackshade,
                ),
                const SizedBox(width: 6),
                Text(
                  gender["label"],
                  style: s.copyWith(
                    color: isSelected ? primary : blackshade,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}