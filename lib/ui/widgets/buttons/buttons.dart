import 'package:flutter/material.dart';
import '/core/constant/color.dart'; // your colors
import '/core/constant/fonts.dart'; // your text styles

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double height;
  final double width;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height = 40,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: onPressed != null ? primary : Colors.grey,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3,
        ),
        onPressed: onPressed,
        child: FittedBox(
          child: Text(
            text,
            style: b.copyWith(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
