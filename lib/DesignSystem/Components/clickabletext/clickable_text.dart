import 'package:flutter/material.dart';
import 'clickable_text_view_model.dart';

class ClickableText extends StatelessWidget {
  final ClickableTextViewModel viewModel;

  const ClickableText._({super.key, required this.viewModel});

  static Widget instantiate({required ClickableTextViewModel viewModel}) {
    return ClickableText._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: viewModel.onTap,
      child: Text(
        viewModel.text,
        style: TextStyle(
          color: viewModel.color,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
