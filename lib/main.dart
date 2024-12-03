import 'package:flutter/material.dart';
import 'package:store_app/DesignSystem/Samples/main_button_sample_screen.dart';
import 'package:store_app/DesignSystem/Samples/nav_bar_sample_screen.dart';
import 'package:store_app/DesignSystem/Samples/product_card_sample_screen.dart';
import 'package:store_app/DesignSystem/Samples/search_bar_sample_screen.dart';
import 'package:store_app/Scenes/bag.dart';
import 'package:store_app/Scenes/home.dart';
import 'package:store_app/Scenes/product.dart';
import 'package:store_app/Scenes/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BagScreen(),
    );
  }
}
