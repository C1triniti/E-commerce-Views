import 'package:flutter/material.dart';
import '../../Shared/colors.dart';
import '../../Shared/styles.dart';
import 'main_button_view_model.dart';

class CustomButton extends StatelessWidget {
  final ButtonViewModel viewModel;

  const CustomButton._({super.key, required this.viewModel});

  static Widget instantiate({required ButtonViewModel viewModel}) {
    return CustomButton._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;
    double paddingVertical;
    double paddingHorizontal;
    double iconSize;

    if (viewModel.size == ButtonSize.normal) {
      textStyle = button1Bold;
      paddingVertical = 16.0;
      paddingHorizontal = 24.0;
      iconSize = 24.0;
    } else {
      textStyle = button2Semibold;
      paddingVertical = 8.0;
      paddingHorizontal = 16.0;
      iconSize = 24.0;
    }

    return ElevatedButton(
      onPressed: viewModel.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: primary600,
        padding: EdgeInsets.symmetric(
          vertical: paddingVertical,
          horizontal: paddingHorizontal,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: viewModel.icon != null
          ? Icon(viewModel.icon, size: iconSize, color: Colors.white)
          : Text(
              viewModel.text!,
              style: textStyle.copyWith(color: Colors.white),
            ),
    );
  }
}
