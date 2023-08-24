import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const PasswordTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.controller,
  });

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    );
    const colorHint = Color.fromRGBO(102, 112, 133, 1);

    return TextFormField(
      onChanged: widget.onChanged,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: _showPassword,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock_rounded, color: colorHint),
        suffixIcon: GestureDetector(
          child: Icon(
            _showPassword ? Icons.visibility : Icons.visibility_off,
          ),
          onTap: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
        ),
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: color.primary)),
        isDense: true,
        label: widget.label != null ? Text(widget.label!) : null,
        hintText: widget.hint,
        errorText: widget.errorMessage,
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: color.error)),
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: color.error)),
        focusColor: color.primary,
      ),
    );
  }
}
