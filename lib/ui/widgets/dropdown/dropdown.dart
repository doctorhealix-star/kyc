import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/fonts.dart';

class Dropdown extends StatelessWidget {
  List<String?> HospitalType;
String? hint;
  String? label;
  final ValueChanged<String?> onChanged;

  Dropdown({
    super.key,
    required this.HospitalType,
    required this.hint,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String?>(
        hint: Row(
          children: [
            Text('${hint}',style: s.copyWith(),),
          ],
        ),
        buttonStyleData: ButtonStyleData(
          // This is necessary for the ink response to match our customButton radius.
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: greyshade.withOpacity(0.5),width: 1.0)
          ),

        ),
        iconStyleData: IconStyleData(
          icon:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: LineIcon.arrowCircleDown(),
          )
        ),
        dropdownStyleData: DropdownStyleData(
elevation: 2,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          // offset: const Offset(0, -4),
        ),
        isExpanded: true,
        value: label,
        items: HospitalType.map((String? items) {
          return DropdownMenuItem<String?>(
            value: items,
            child: Text(items!, style: s.copyWith(fontSize: 14)),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
