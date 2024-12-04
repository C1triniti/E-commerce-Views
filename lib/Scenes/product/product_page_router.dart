import 'package:flutter/material.dart';
import 'package:store_app/Scenes/bag/bag_page_factory.dart';
import 'product_page_factory.dart';


class ProductRouter {
  static void goToProductPage(BuildContext context) {
    Navigator.push( 
      context,
      MaterialPageRoute(builder: (context) => ProductPageFactory.create()),
    );
  }

  static void goToBagPage(BuildContext context) {
    Navigator.push( 
      context,
      MaterialPageRoute(builder: (context) => BagPageFactory.create()),
    );
  }
}