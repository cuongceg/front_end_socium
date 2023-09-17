import 'package:flutter/material.dart';

typedef ToggleHintCallback = void Function()?;

class ToggleHintPasswordButton extends StatelessWidget {
  final bool hintStatus;
  final ToggleHintCallback onToggle;

  const ToggleHintPasswordButton({
    super.key,
    required this.hintStatus,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToggle,
      child: Icon(hintStatus ? Icons.remove_red_eye_outlined : Icons.visibility_off_sharp),
    );
  }
}
