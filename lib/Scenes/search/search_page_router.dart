import 'package:flutter/material.dart';
import 'package:store_app/Scenes/bag/bag_page_factory.dart';
import 'package:store_app/Scenes/home/home_page_factory.dart';
import '../product/product_page_factory.dart';
import 'search_page_factory.dart';

class SearchRouter {
  static void goToSearchPage(BuildContext context) {
    Navigator.push( 
      context,
      MaterialPageRoute(builder: (context) => SearchPageFactory.create()),
    );
  }

  static void goToHomePage(BuildContext context) {
    Navigator.push( 
      context,
      MaterialPageRoute(builder: (context) => HomePageFactory.create()),
    );
  }

  static void goToBagPage(BuildContext context) {
    Navigator.push( 
      context,
      MaterialPageRoute(builder: (context) => BagPageFactory.create()),
    );
  }

  static void goToProductPage(BuildContext context) {
    Navigator.push( 
      context,
      MaterialPageRoute(builder: (context) => ProductPageFactory.create()),
    );
  }
}