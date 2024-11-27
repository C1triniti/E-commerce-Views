import 'package:flutter/material.dart';

class ButtonViewModel {
  final String? text;
  final IconData? icon;
  final VoidCallback onPressed;
  final ButtonSize size;

  ButtonViewModel({
    this.text,
    this.icon,
    required this.onPressed,
    this.size = ButtonSize.normal,
  });
}

enum ButtonSize { normal, small }
