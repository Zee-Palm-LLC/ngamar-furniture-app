import 'package:flutter/material.dart';
import 'package:ngamar/app/data/constants/constants.dart';

class AuthField extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;
  const AuthField({
    required this.title,
    required this.hintText,
    required this.controller,
    this.validator,
    this.textInputAction,
    this.keyboardType,
    this.isPassword = false,
    super.key,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppTypography.kMedium16.copyWith(
            color: AppColors.kGrey70,
          ),
        ),
        SizedBox(height: AppSpacing.fiveVertical),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          // ignore: avoid_bool_literals_in_conditional_expressions
          obscureText: widget.isPassword ? isObscure : false,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.kGrey100,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
