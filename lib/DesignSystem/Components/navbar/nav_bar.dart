import 'package:flutter/material.dart';
import 'package:store_app/DesignSystem/Shared/colors.dart';
import 'nav_bar_view_model.dart';

class BottomTabBar extends StatelessWidget {
  final BottomTabBarViewModel viewModel;
  final int currentIndex;

  const BottomTabBar._({super.key, required this.viewModel, required this.currentIndex}); // Atualizei aqui

  static Widget instantiate({required BottomTabBarViewModel viewModel, required int currentIndex}) {
    return BottomTabBar._(viewModel: viewModel, currentIndex: currentIndex); // Atualizei aqui
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: viewModel.bottomTabs,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primary600,
      unselectedItemColor: grey700,
      showUnselectedLabels: false,
      currentIndex: currentIndex,
      onTap: viewModel.onIndexChanged,
    );
  }
}
