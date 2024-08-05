import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final String? prefixText;
  final String? prefixIcon;
  final String? suffixIcon;
  final FormFieldValidator<String>? validator;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    this.prefixText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixText: prefixText,
        prefixIcon: prefixIcon != null ? SvgPicture.asset(prefixIcon!) : null,
        suffixIcon: suffixIcon != null ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SvgPicture.asset(suffixIcon!,),
        ) : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
      ),
      validator: validator,
    );
  }
}