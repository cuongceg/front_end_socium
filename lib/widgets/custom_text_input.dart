import 'package:flutter/material.dart';

typedef CustomTextInputValidateConditionCallback = bool Function(String?)?;
typedef CustomTextInputCallback = void Function(String)?;

class CustomTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final CustomTextInputValidateConditionCallback validateCondition;
  final String? messageOnValidationFailed;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final CustomTextInputCallback onChanged;

  const CustomTextInput({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.validateCondition,
    this.messageOnValidationFailed,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      validator: (value) {
        if (this.validateCondition == null) {
          return null;
        }
        return this.validateCondition!(value) ? this.messageOnValidationFailed : null;
      },
      decoration: InputDecoration(
        labelText: this.labelText,
        hintText: this.hintText,
        fillColor: Colors.white,
        filled: true,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
          borderSide: BorderSide(
            color: Colors.deepPurple,
            width: 2.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
          borderSide: BorderSide(
            color: Colors.deepPurple,
            width: 2.0,
          ),
        ),
        prefixIcon: this.prefixIcon,
        suffixIcon: this.suffixIcon,
      ),
      onChanged: onChanged,
    );
  }
}
