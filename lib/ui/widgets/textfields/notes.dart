import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/fonts.dart';

class NotesTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const NotesTextField({
    super.key,
    required this.controller,
    this.hint = "Enter notes...",
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: 3,         // start with one line
      maxLines: 7,      // expand automatically
      expands: false,
      // allows auto growth instead of filling parent
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: b,
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 6),
      ),
    );
  }
}
