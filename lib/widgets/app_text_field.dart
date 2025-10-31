import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  const AppTextField({super.key, required this.hint, this.obscureText=false, this.keyboardType, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(hintText: hint),
      onChanged: onChanged,
    );
  }
}
