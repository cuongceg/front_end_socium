import 'package:app/widgets/toggle_hint_password_button.dart';
import 'package:flutter/material.dart';

typedef CustomPasswordInputValidateConditionCallback = bool Function(String?)?;

class CustomPasswordInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final CustomPasswordInputValidateConditionCallback validateCondition;
  final String? messageOnValidationFailed;

  const CustomPasswordInput({
    super.key,
    this.controller,
    this.labelText,
    this.validateCondition,
    this.messageOnValidationFailed,
  });

  @override
  State<CustomPasswordInput> createState() => _CustomPasswordInputState();
}

class _CustomPasswordInputState extends State<CustomPasswordInput> {
  bool hint = false;

  void toggleHint() {
    setState(() => hint = !hint);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.widget.controller,
      obscureText: !hint,
      validator: (value) {
        if (this.widget.validateCondition == null) {
          return null;
        }
        return this.widget.validateCondition!(value) ? this.widget.messageOnValidationFailed : null;
      },
      decoration: InputDecoration(
        labelText: this.widget.labelText ?? 'Password',
        filled: true,
        fillColor: Colors.white,
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
        suffix: ToggleHintPasswordButton(
          hintStatus: hint,
          onToggle: toggleHint,
        ),
      ),
    );
  }
}
