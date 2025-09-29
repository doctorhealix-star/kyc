import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kyc/core/constant/color.dart';

class AppTextfield extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool isPassword;
  final int? maxLength;
  final int? maxLines;
  final TextInputType KeyboardType;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? Validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final Widget? PrefixIcon;
  final Widget? SuffixIcon;
  final FocusNode? focusNode;
  final bool autofous;
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool enabled;

  const AppTextfield(
      {super.key, required this.controller, required this.hint, required this.label, this.autofous = false, this.isPassword= false, this.maxLength,  this.maxLines =1,  this.KeyboardType= TextInputType.text,  this.textCapitalization=TextCapitalization.sentences, this.inputFormatters, this.Validator, this.onChanged, this.onSubmitted, this.PrefixIcon, this.SuffixIcon, this.focusNode, this.fillColor, this.borderColor, this.hintStyle, this.labelStyle,  this.enabled=true,});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height*0.055,
      child: TextField(
        controller:controller,
        maxLength: maxLength,
        maxLines: maxLines?? 1,
        enabled: enabled,
        decoration: InputDecoration(
          isDense: true,
          labelText: label,
          labelStyle: labelStyle,
contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 6),
          hintText: hint,
          hintStyle: hintStyle,
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
    );
  }
}
