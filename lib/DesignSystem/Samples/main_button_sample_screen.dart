import 'package:flutter/material.dart';
import '../Components/mainbutton/main_button.dart';
import '../Components/mainbutton/main_button_view_model.dart';


class ButtonSampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonViewModel normalButtonViewModel = ButtonViewModel(
      text: 'Label',
      onPressed: () {
        print('Normal Button Pressed');
      },
      size: ButtonSize.normal,
    );

    final ButtonViewModel smallButtonViewModel = ButtonViewModel(
      icon: Icons.shopping_cart,
      onPressed: () {
        print('Small Button Pressed');
      },
      size: ButtonSize.small,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Button Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton.instantiate(viewModel: normalButtonViewModel),
              SizedBox(height: 16.0),
              CustomButton.instantiate(viewModel: smallButtonViewModel),
            ],
          ),
        ),
      ),
    );
  }
}
