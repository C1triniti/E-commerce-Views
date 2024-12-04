import 'package:flutter/material.dart';
import 'package:store_app/Scenes/home/home_page_factory.dart';
import 'bag_page_factory.dart';

class BagRouter {
  static void goToBagPage(BuildContext context) {
    Navigator.push( 
      context,
      MaterialPageRoute(builder: (context) => BagPageFactory.create()),
    );
  }

  static void goToHomePage(BuildContext context) {
    Navigator.push( 
      context,
      MaterialPageRoute(builder: (context) => HomePageFactory.create()),
    );
  }
}