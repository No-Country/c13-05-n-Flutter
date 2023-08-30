import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final IconData? icon;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.controller,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    );
    const colorHint = Color.fromRGBO(102, 112, 133, 1);

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: colorHint),
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
