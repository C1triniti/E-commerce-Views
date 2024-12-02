import 'package:flutter/material.dart';

class ClickableTextViewModel {
  final String text;
  final VoidCallback onTap;
  final Color color;

  ClickableTextViewModel({
    required this.text,
    required this.onTap,
    this.color = Colors.blue, // Cor padrão para o link
  });
}
