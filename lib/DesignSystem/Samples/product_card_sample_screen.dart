import 'package:flutter/material.dart';
import '../Components/productcard/product_card.dart';
import '../Components/productcard/product_card_view_model.dart';


class ProductCardSampleScreen extends StatelessWidget {
  const ProductCardSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductCardViewModel> viewModels = [
      ProductCardViewModel(
        imageUrl: 'lib/Images/joggers.png',
        productName: 'Twill Suit',
        rating: 4.1,
        reviewCount: 272,
        price: 5233.00,
      ),
      ProductCardViewModel(
        imageUrl: 'lib/Images/t-shirt.png',
        productName: 'Joggers',
        rating: 4.5,
        reviewCount: 150,
        price: 6432.00,
      ),
      // Adicione mais cartões conforme necessário
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Card Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.7,  // Ajuste conforme necessário
          ),
          itemCount: viewModels.length,
          itemBuilder: (context, index) {
            return ProductCard.instantiate(viewModel: viewModels[index]);
          },
        ),
      ),
    );
  }
}
