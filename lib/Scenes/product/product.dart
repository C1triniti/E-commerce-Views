import 'package:flutter/material.dart';
import 'package:store_app/DesignSystem/Components/clickabletext/clickable_text.dart';
import 'package:store_app/DesignSystem/Components/clickabletext/clickable_text_view_model.dart';
import 'package:store_app/DesignSystem/Components/productcard/product_card_view_model.dart';
import 'package:store_app/DesignSystem/Shared/colors.dart';
import 'package:store_app/DesignSystem/Shared/styles.dart';
import 'package:store_app/Scenes/product/product_page_router.dart';
import '../../DesignSystem/Components/mainbutton/main_button.dart';
import '../../DesignSystem/Components/mainbutton/main_button_view_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});

  final product = ProductCardViewModel(
    imageUrl: 'lib/Images/round-t-shirt.png',
    productName: 'Round T-Shirt',
    rating: 4.1,
    reviewCount: 272,
    price: 1499.00,
  );

  final ButtonViewModel smallButtonViewModel = ButtonViewModel(
    icon: Icons.favorite_border,
    onPressed: () {
      print('Small Button Pressed');
    },
    size: ButtonSize.small,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Product Details'),
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                ProductRouter.goToBagPage(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClickableText.instantiate(
                    viewModel: ClickableTextViewModel(
                      text: 'Zara', 
                      onTap: () {},
                      color: grey950,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: primary700, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${product.rating}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '(${product.reviewCount} reviews)',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                product.productName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('item 42627743'),
              const SizedBox(height: 10),
              Image.asset(
                product.imageUrl,
                height: 500,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle_rounded,
                    color: primary600,
                    size: 18,
                  ),
                  Icon(
                    Icons.circle_outlined,
                    color: primary600,
                    size: 18,
                  ),
                  Icon(
                    Icons.circle_outlined,
                    color: primary600,
                    size: 18,
                  ),
                  Icon(
                    Icons.circle_outlined,
                    color: primary600,
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'R\$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomButton.instantiate(
                      viewModel: ButtonViewModel(
                        text: 'ADD TO BAG',
                        onPressed: () {
                          ProductRouter.goToBagPage(context);
                        },
                        size: ButtonSize.normal,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 40,
                    child: CustomButton.instantiate(viewModel: smallButtonViewModel),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ClickableText.instantiate(
                viewModel: ClickableTextViewModel(
                  text: 'Check-in store availability',
                  onTap: () {},
                  color: grey950,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you...',
                style: TextStyle(
                  fontSize: 16,
                  color: grey950,
                ),
              ),

              const SizedBox(height: 16),

              _buildFunctionItem('Details'),
              _buildFunctionItem('How to Use'),
              _buildFunctionItem('Reviews'),
              _buildFunctionItem('Q&A (5)'),
            ],
          ),
        ),
      ),
    );
  }
}


Widget _buildFunctionItem(String name) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: text2Xl),
          const Icon(Icons.arrow_forward_ios_rounded),
        ],
      ),
    );
  }