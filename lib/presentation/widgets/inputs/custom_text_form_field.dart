import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscure;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.obscure = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    );
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: color.primary)),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: color.error)),
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: color.error)),
        focusColor: color.primary,
      ),
    );
  }
}
