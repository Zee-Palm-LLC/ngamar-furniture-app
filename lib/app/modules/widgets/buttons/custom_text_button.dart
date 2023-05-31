import 'package:flutter/material.dart';
import 'package:ngamar/app/data/constants/constants.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  const CustomTextButton({
    required this.onPressed,
    required this.text,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style:
            AppTypography.kMedium14.copyWith(color: color ?? AppColors.kError),
      ),
    );
  }
}
