import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/fonts.dart';

class CheckboxWithOther extends StatefulWidget {
  final List<String> options; // only titles, dynamic
  const CheckboxWithOther({super.key, required this.options});

  @override
  State<CheckboxWithOther> createState() => _CheckboxWithOtherState();
}

class _CheckboxWithOtherState extends State<CheckboxWithOther> {
  late Map<String, bool> checked;
  String otherText = '';

  @override
  void initState() {
    super.initState();
    // Initialize all options as unchecked
    checked = {for (var option in widget.options) option: false};
  }

  @override
  Widget build(BuildContext context) {
    // Group options in pairs
    List<Widget> rows = [];
    for (int i = 0; i < widget.options.length; i += 2) {
      final first = widget.options[i];
      final second = (i + 1 < widget.options.length) ? widget.options[i + 1] : null;

      rows.add(
        Row(
          children: [
            Expanded(child: _buildCheckbox(first)),
            if (second != null) Expanded(child: _buildCheckbox(second)),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...rows,
        // Show "Other" text field if selected
        if (checked.containsKey('Other') && checked['Other'] == true)
          TextField(
            onChanged: (value) => otherText = value,
            decoration: InputDecoration(
              isDense: true,

              contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 6),
              hintText: 'Suggestions',
              hintStyle: s,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: greyshade.withOpacity(0.5),width: 1.0)
              ),
              focusedBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: primary,width: 2.0)
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: red,width: 1.0)
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCheckbox(String option) {
    return Row(
      children: [
        Checkbox(
          value: checked[option],
          onChanged: (value) {
            setState(() {
              // Uncheck all other options first
              checked.updateAll((key, _) => false);
              // Set the selected option
              checked[option] = value ?? false;
            });
          },
        ),
        Flexible(child: Text(option, style: const TextStyle())),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
//
// class CheckboxWithOther extends StatefulWidget {
//   final List<String> options; // only titles, dynamic
//   const CheckboxWithOther({super.key, required this.options});
//
//   @override
//   State<CheckboxWithOther> createState() => _CheckboxWithOtherState();
// }
//
// class _CheckboxWithOtherState extends State<CheckboxWithOther> {
//   late Map<String, bool> checked;
//   String otherText = '';
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize all options as unchecked
//     checked = {for (var option in widget.options) option: false};
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Group options in pairs
//     List<Widget> rows = [];
//     for (int i = 0; i < widget.options.length; i += 2) {
//       final first = widget.options[i];
//       final second = (i + 1 < widget.options.length) ? widget.options[i + 1] : null;
//
//       rows.add(
//         Row(
//           children: [
//             Expanded(child: _buildCheckbox(first)),
//             if (second != null) Expanded(child: _buildCheckbox(second)),
//           ],
//         ),
//       );
//     }
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ...rows,
//         // Show "Other" text field if selected
//         if (checked.containsKey('Other') && checked['Other'] == true)
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
//             child: TextField(
//               onChanged: (value) => otherText = value,
//               decoration: const InputDecoration(
//                 hintText: 'Enter other value',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
//
//   Widget _buildCheckbox(String option) {
//     return Row(
//       children: [
//         Checkbox(
//           value: checked[option],
//           onChanged: (value) {
//             setState(() {
//               checked[option] = value ?? false;
//             });
//           },
//         ),
//         Flexible(child: Text(option, style: const TextStyle(fontWeight: FontWeight.bold))),
//       ],
//     );
//   }
// }
