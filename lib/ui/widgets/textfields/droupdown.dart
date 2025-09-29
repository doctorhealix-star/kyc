import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

import '../../../core/constant/color.dart';

/// A reusable auto-complete search text field
/// Uses `searchfield` package for suggestions.
class AppAutoCompleteTextField extends StatelessWidget {
  final String label;
  final String hint;
  final List<String> suggestions;
  final TextEditingController controller;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final Color? borderColor;
  final bool enabled;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const AppAutoCompleteTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.suggestions,
    required this.controller,
    this.labelStyle,
    this.hintStyle,
    this.fillColor,
    this.borderColor,
    this.enabled = true,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;

    return SizedBox(

      height: height*0.055,
      child: SearchField(
        controller: controller,
        enabled: enabled,
        hint: hint,
        maxSuggestionBoxHeight: 70,
        suggestionsDecoration: SuggestionDecoration(
          color: white,
          hoverColor: white,
          itemPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(style: BorderStyle.none), // 👈 removes dividers
        ),
        suggestionState: Suggestion.expand,
        searchInputDecoration: SearchInputDecoration(
          labelText: label,
          labelStyle: labelStyle ?? theme.textTheme.bodyMedium,
          hintStyle: hintStyle ??
              theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
          filled: true,
          fillColor: fillColor ?? white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: greyshade.withOpacity(0.5),
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: primary, width: 2.0),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
        ),

          suggestions: suggestions
          .map((e) => SearchFieldListItem(
      e,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        decoration: BoxDecoration(
          color: Colors.transparent, // 👈 no background
          border:Border.all(style: BorderStyle.none),          // 👈 no border
        ),
        child: Text(
          e,
          style: theme.textTheme.bodyMedium,
        ),
      ),
    ))
        .toList(),
// 👈 custom child avoids default ListTile divider look
        onSuggestionTap: (item) {
          controller.text = item.searchKey;
          if (onChanged != null) onChanged!(item.searchKey);
        },
        onSubmit: onSubmitted,
      )

    );
  }
}
